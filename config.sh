apt-get -qqy update
apt-get -qqy install postgresql python-psycopg2
apt-get -qqy install python-pip

pip install flask
pip install Flask-SQLAlchemy
pip install Flask-WTF
pip install Flask-SuperAdmin
pip install requests
pip install httplib2
pip install pyimgur

su postgres -c 'createuser -dRS vagrant'
su vagrant -c 'createdb'
su vagrant -c 'createdb trackdb'

su vagrant -c 'python /vagrant/db_populator.py'

echo 'cd /vagrant' > /home/vagrant/.bash_profile # This line tells where Vagrant should head to after 'vagrant ssh'

MOTDblast="[36m[1mThis is a placeholder for the MOTD[m"
echo -e $MOTDblast > /etc/motd

if [ ! -f /home/vagrant/.bash_profile ]; then
  ln -s /vagrant/.bash_profile /home/vagrant/.bash_profile
fi
