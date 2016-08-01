# Copy synced folder to project directory
mkdir -p /var/www/tracking-app
cp -a /tracking-app/ /var/www

# Package installs
apt-get -qqy update
apt-get -qqy install apache2 \
                     libapache2-mod-wsgi \
                     postgresql python-psycopg2 \
                     python-pip

# PIP installs
pip install -r /var/www/tracking-app/trackapp/requirements.txt

# Overwrite mod-wsgi configuration with custom configuration
cp /var/www/tracking-app/apache-scripts/mod-wsgi.conf  /etc/apache2/sites-enabled/000-default.conf

# Restart Apache
apache2ctl restart

# Create Postgres user Vagrant and create 'trackdb' database
su postgres -c "psql -c \"CREATE USER pgdbuser with password 'pgpassword';\""
su postgres -c 'createuser -dRS vagrant'
su postgres -c 'createdb trackdb'
su vagrant -c 'createdb'

# Run `db_populator.py` to initialize tables and populate with sample data
su vagrant -c 'python /var/www/tracking-app/db_populator.py'
