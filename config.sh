apt-get -qqy update
apt-get -qqy install postgresql python-psycopg2
apt-get -qqy install python-pip

pip install flask
pip install sqlalchemy
pip install requests
pip install httplib2
pip install flask-seasurf
pip install pyimgur

su postgres -c 'createuser -dRS vagrant'
su vagrant -c 'createdb'
su vagrant -c 'createdb trackdb'

echo 'cd /vagrant' > /home/vagrant/.bash_profile

vagrantTip="[36m[1mThis is a placeholder for the MOTD[m"
echo -e $vagrantTip > /etc/motd

if [ ! -f /home/vagrant/.bash_profile ]; then
  ln -s /vagrant/.bash_profile /home/vagrant/.bash_profile
fi
