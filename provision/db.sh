apt-get -qqy update
apt-get -qqy install postgresql

su postgres -c "psql -c \"CREATE USER pgdbuser with password 'pgpassword';\""
su postgres -c 'createdb trackdb'

echo 'host all all 172.22.22.201/32 password' >> /etc/postgresql/$(ls /etc/postgresql)/main/pg_hba.conf
echo "listen_addresses='172.22.22.201'" >> /etc/postgresql/$(ls /etc/postgresql)/main/postgresql.conf
