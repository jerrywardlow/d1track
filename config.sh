apt-get -qqy update
apt-get -qqy install postgresql python-psycopg2
apt-get -qqy install python-pip

# PIP installs
pip install flask
pip install Flask-SQLAlchemy
pip install Flask-WTF
pip install Flask-SuperAdmin
pip install requests
pip install httplib2
pip install pyimgur

# Create Postgres user Vagrant and create 'trackdb' database
su postgres -c 'createuser -dRS vagrant'
su vagrant -c 'createdb'
su vagrant -c 'createdb trackdb'

# Run `db_populator.py` to initialize tables and populate with sample data
su vagrant -c 'python /vagrant/db_populator.py'

# Add to '.bash_profile' to change to shared directory on SSH
echo 'cd /vagrant' > /home/vagrant/.bash_profile

# Add string to the MOTD
MOTDblast="[36m[1mThis is a placeholder for the MOTD[m"
echo -e $MOTDblast > /etc/motd

# Symlink .bask_profile if necessary
if [ ! -f /home/vagrant/.bash_profile ]; then
  ln -s /vagrant/.bash_profile /home/vagrant/.bash_profile
fi
