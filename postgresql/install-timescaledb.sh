#!/bin/bash

sh -c "echo 'deb https://packagecloud.io/timescale/timescaledb/debian/ `lsb_release -c -s` main' > /etc/apt/sources.list.d/timescaledb.list"

cd /tmp

wget --quiet -O 'timescaledb.gpg' https://packagecloud.io/timescale/timescaledb/gpgkey && apt-key add timescaledb.gpg

apt update

apt install -y timescaledb-2-postgresql-13 && timescaledb-tune --quiet --yes

pg_ctlcluster 13 main restart