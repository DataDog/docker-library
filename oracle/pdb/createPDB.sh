#!/bin/bash

# Initialize Oracle Environment
source /home/oracle/.bashrc
sqlplus / as sysdba <<EOF

-- Create a pluggable database
CREATE PLUGGABLE DATABASE mypdb ADMIN USER pdbadmin IDENTIFIED BY pdbadminpassword
  FILE_NAME_CONVERT=('/u01/app/oracle/oradata/mycdb/pdbseed/', '/u01/app/oracle/oradata/mycdb/mypdb/')
  STORAGE (MAXSIZE 2G)
  DEFAULT TABLESPACE users
    DATAFILE '/u01/app/oracle/oradata/mycdb/mypdb/users01.dbf'
    SIZE 500M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;

-- Open the PDB
ALTER PLUGGABLE DATABASE mypdb OPEN;

-- Save the PDB state
ALTER PLUGGABLE DATABASE mypdb SAVE STATE;

EOF
