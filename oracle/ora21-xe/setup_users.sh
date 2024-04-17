#!/bin/bash

sqlplus / as sysdba <<EOF

startup

@/tmp/setup_users.sql

-- table for query metrics test
create table sys.t(n number) ;
grant insert on sys.t to c##datadog ;

-- tablespace for tablespace metrics test
create tablespace tbs_test datafile '/opt/oracle/oradata/XE/tbs_test01.dbf' size 100M ;

shutdown abort

EOF