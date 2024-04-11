#!/bin/bash

# Initialize Oracle Environment
source /home/oracle/.bashrc
sqlplus / as sysdba <<EOF

-- Start the database instance
STARTUP NOMOUNT;
-- Create a new CDB
CREATE DATABASE mycdb
   USER SYS IDENTIFIED BY mysyspassword
   USER SYSTEM IDENTIFIED BY mysystempassword
   LOGFILE GROUP 1 ('/u01/app/oracle/oradata/mycdb/redo01.log') SIZE 100M,
           GROUP 2 ('/u01/app/oracle/oradata/mycdb/redo02.log') SIZE 100M
   MAXLOGFILES 5
   MAXLOGMEMBERS 5
   MAXLOGHISTORY 1
   MAXDATAFILES 100
   CHARACTER SET AL32UTF8
   NATIONAL CHARACTER SET AL16UTF16
   EXTENT MANAGEMENT LOCAL
   DATAFILE '/u01/app/oracle/oradata/mycdb/system01.dbf' SIZE 700M REUSE
   SYSAUX DATAFILE '/u01/app/oracle/oradata/mycdb/sysaux01.dbf' SIZE 550M REUSE
   DEFAULT TABLESPACE users
      DATAFILE '/u01/app/oracle/oradata/mycdb/users01.dbf'
      SIZE 500M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED
   DEFAULT TEMPORARY TABLESPACE temp
      TEMPFILE '/u01/app/oracle/oradata/mycdb/temp01.dbf'
      SIZE 20M REUSE
   UNDO TABLESPACE undotbs1
      DATAFILE '/u01/app/oracle/oradata/mycdb/undotbs01.dbf'
      SIZE 200M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;

-- Open the database
ALTER DATABASE OPEN;

-- Save the database state
ALTER PLUGGABLE DATABASE ALL SAVE STATE;

EOF
