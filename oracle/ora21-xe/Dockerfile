# Use an Oracle Database Express Edition image as base image
FROM container-registry.oracle.com/database/express:21.3.0-xe

# Copy custom scripts to the image
COPY setup_users.sh /tmp
COPY setup_users.sql /tmp

# Run the scripts to setup CDB and PDB
RUN /bin/bash /tmp/setup_users.sh
