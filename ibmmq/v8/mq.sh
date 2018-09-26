#!/bin/bash
# -*- mode: sh -*-
# © Copyright IBM Corporation 2015, 2016
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e

configure.sh

stop()
{
  endmqm $MQ_QMGR_NAME
}

config()
{
  : ${MQ_QMGR_NAME?"ERROR: You need to set the MQ_QMGR_NAME environment variable"}
  # Populate and update the contents of /var/mqm - this is needed for
	# bind-mounted volumes, and also to migrate data from previous versions of MQ
  /opt/mqm/bin/amqicdir -i -f
  ls -l /var/mqm
  source /opt/mqm/bin/setmqenv -s
  echo "----------------------------------------"
  dspmqver
  echo "----------------------------------------"

  QMGR_EXISTS=`dspmq | grep ${MQ_QMGR_NAME} > /dev/null ; echo $?`
  echo $QMGR_EXISTS
  if [ ${QMGR_EXISTS} -ne 0 ]; then
    echo "Checking filesystem..."
    amqmfsck /var/mqm
    echo "----------------------------------------"
    crtmqm -q ${MQ_QMGR_NAME} || true
    if [ ${MQ_QMGR_CMDLEVEL+x} ]; then
      # Enables the specified command level, then stops the queue manager
      strmqm -e CMDLEVEL=${MQ_QMGR_CMDLEVEL} || true
    fi
    echo "----------------------------------------"
  fi
  strmqm ${MQ_QMGR_NAME}
  if [ ${QMGR_EXISTS} -ne 0 ]; then
    echo "----------------------------------------"
    if [ -f /etc/mqm/listener.mqsc ]; then
      runmqsc ${MQ_QMGR_NAME} < /etc/mqm/listener.mqsc
    fi
    if [ -f /etc/mqm/config.mqsc ]; then
      runmqsc ${MQ_QMGR_NAME} < /etc/mqm/config.mqsc
    fi
  fi
  echo "----------------------------------------"
}

state()
{
  dspmq -n -m ${MQ_QMGR_NAME} | awk -F '[()]' '{ print $4 }'
}

monitor()
{
  # Loop until "dspmq" says the queue manager is running
  until [ "`state`" == "RUNNING" ]; do
    sleep 1
  done
  dspmq

  # Loop until "dspmq" says the queue manager is not running any more
  until [ "`state`" != "RUNNING" ]; do
    sleep 5
  done

  # Wait until queue manager has ended before exiting
  while true; do
    STATE=`state`
    case "$STATE" in
      ENDED*) break;;
      *) ;;
    esac
    sleep 1
  done
  dspmq
}

MQ_DEV=${MQ_DEV:-"true"}
MQ_ADMIN_NAME="admin"
MQ_ADMIN_PASSWORD=${MQ_ADMIN_PASSWORD:-"passw0rd"}
MQ_APP_NAME="app"
MQ_APP_PASSWORD=${MQ_APP_PASSWORD:-""}

configure_os_user()
{
  # The group ID of the user to configure
  local -r GROUP_NAME=$1
  # Name of environment variable containing the user name
  local -r USER_VAR=$2
  # Name of environment variable containing the password
  local -r PASSWORD=$3
  # Home directory for the user
  local -r HOME=$4
  # Determine the login name of the user (assuming it exists already)

  # if user does not exist
  if ! id ${!USER_VAR} 2>1 > /dev/null; then
    # create
    useradd --gid ${GROUP_NAME} --home ${HOME} ${!USER_VAR}
  fi
  # Change the user's password (if set)
  if [ ! "${!PASSWORD}" == "" ]; then
    echo ${!USER_VAR}:${!PASSWORD} | chpasswd
  fi
}

echo "Configuring app user"
if ! getent group mqclient; then
  # Group doesn't exist already
  groupadd mqclient
fi
echo 'hi'
configure_os_user mqclient MQ_APP_NAME MQ_APP_PASSWORD /home/app
echo 'hi2'
# Set authorities to give access to qmgr, queues and topic

echo 'hi3'
configure_os_user mqm MQ_ADMIN_NAME MQ_ADMIN_PASSWORD /home/admin

mq-license-check.sh
config
su -l mqm -c "setmqaut -m ${MQ_QMGR_NAME} -t qmgr -g mqclient +connect +inq"
su -l mqm -c "setmqaut -m ${MQ_QMGR_NAME} -n \"DEV.**\" -t queue -g mqclient +put +get +browse +inq"
su -l mqm -c "setmqaut -m ${MQ_QMGR_NAME} -n \"DEV.**\" -t topic -g mqclient +sub +pub"
trap stop SIGTERM SIGINT
monitor
state
