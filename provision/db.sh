apt-get -qqy update
apt-get -qqy install postgresql

su postgres -c "psql -c \"CREATE USER pgdbuser with password 'pgpassword';\""
su postgres -c 'createdb trackdb'
