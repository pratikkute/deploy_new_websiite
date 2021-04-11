#! /bin/bash
sudo timedatectl set-timezone Asia/Kolkata
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install python3-pip -y
sudo apt-get install apache2 libapache2-mod-wsgi-py3 -y
sudo pip3 install virtualenv 
cd ~
mkdir venv 
virtualenv -p python3 ~/venv/.
source ~/venv/bin/activate
pip install -r ~/requirements.txt
django-admin.py startproject LOGOUTstudio
cd ~/LOGOUTstudio
mkdir media static templates
python manage.py startapp home
python manage.py migrate
sudo adduser $USER www-data
sudo chown -R :www-data ~/LOGOUTstudio/
sudo chown :www-data ~/LOGOUTstudio/db.sqlite3
sudo chmod -R 775 ~/venv/
sudo chmod -R 775 ~/LOGOUTstudio/
sudo chown -R $USER /etc/apache2/sites-available/*
sudo cp ~/000-default.conf /etc/apache2/sites-available/
sudo cp ~/home_views.py ~/LOGOUTstudio/home/views.py
sudo cp ~/base.html ~/LOGOUTstudio/templates/
sudo cp ~/settings_urls.py ~/LOGOUTstudio/LOGOUTstudio/urls.py
sudo cp ~/home_views.py ~/LOGOUTstudio/home/views.py
sudo cp ~/home_urls.py ~/LOGOUTstudio/home/urls.
sudo mkdir -p ~/LOGOUTstudio/Kolkata/templates/home
sudo cp ~/index.html ~/LOGOUTstudio/home/templates/home/
sudo service apache2 restart