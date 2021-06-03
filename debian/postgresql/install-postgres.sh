#!/bin/bash

apt update
apt -y install gnupg2

cd /tmp

wget --quiet -O postgres-key.asc https://www.postgresql.org/media/keys/ACCC4CF8.asc && apt-key add postgres-key.asc

echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list

apt update

apt install -y postgresql-13

echo 'Postgresql 13 installed! Start it up with "pg_ctlcluster 13 main start" when ready'