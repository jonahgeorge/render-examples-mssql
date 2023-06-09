FROM ubuntu:20.04

RUN apt-get update && apt-get install -y wget software-properties-common
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | tee /etc/apt/trusted.gpg.d/microsoft.asc
RUN add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2022.list)"
RUN apt-get update && apt-get install -y mssql-server

# https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-configure-mssql-conf?view=sql-server-ver16
ENTRYPOINT [ "/opt/mssql/bin/sqlservr" ]
