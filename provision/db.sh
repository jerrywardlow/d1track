apt-get -qqy update
apt-get -qqy install postgresql

su postgres -c "psql -c \"CREATE USER pgdbuser with password 'pgpassword';\""
su postgres -c 'createdb trackdb'

echo 'host all all 192.168.56.0/24 password' >> /etc/postgresql/$(ls /etc/postgresql)/main/pg_hba.conf
echo "listen_addresses='*'" >> /etc/postgresql/$(ls /etc/postgresql)/main/postgresql.conf

service postgresql restart
