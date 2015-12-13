apt-get -qqy update
apt-get -qqy install apache2
apt-get -qqy install libapache2-mod-wsgi
apt-get -qqy install postgresql python-psycopg2
apt-get -qqy install python-pip

# PIP installs
pip install flask
pip install Flask-SQLAlchemy
pip install Flask-WTF
pip install Flask-SuperAdmin
pip install flask-login
pip install requests
pip install httplib2
pip install pyimgur

# Overwrite mod-wsgi configuration with custom configuration
cp /var/www/d1track/wsgi-scripts/mod-wsgi.conf  /etc/apache2/sites-enabled/000-default.conf

# Restart Apache
apache2ctl restart

# Create Postgres user Vagrant and create 'trackdb' database
su postgres -c 'createuser -dRS vagrant'
su postgres -c "psql -c \"CREATE USER trackingdbuser with password 'superawesomepassword';\""
su vagrant -c 'createdb'
su vagrant -c 'createdb trackdb'

# Run `db_populator.py` to initialize tables and populate with sample data
su vagrant -c 'python /var/www/d1track/db_populator.py'

# Add to '.bash_profile' to change to shared directory on SSH
echo 'cd '$1> /home/vagrant/.bash_profile

# Add string to the MOTD
MOTDblast="[36m[1mThis is a placeholder for the MOTD[m"
echo -e $MOTDblast > /etc/motd
