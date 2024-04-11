# Use an Oracle Database base image
FROM oracle/database:19.3.0-ee

# Environment variables
ENV ORACLE_SID=mycdb
ENV ORACLE_PDB=mypdb
ENV ORACLE_PWD=mysecurepassword

# Copy custom scripts to the image
COPY createCDB.sh /home/oracle/scripts/setup/
COPY createPDB.sh /home/oracle/scripts/setup/

# Run the scripts to setup CDB and PDB
RUN /home/oracle/scripts/setup/createCDB.sh
RUN /home/oracle/scripts/setup/createPDB.sh

# Expose the Oracle port
EXPOSE 1521

# Set the default command to run when starting the container
CMD ["startOracle.sh"]
