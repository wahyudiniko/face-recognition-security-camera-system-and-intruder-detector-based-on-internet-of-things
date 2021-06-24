#!/bin/bash

# update and upgrade os
sudo apt-get update
sudo apt-get upgrade

# dependencies
sudo apt-get install --assume-yes build-essential cmake pkg-config
sudo apt-get install --assume-yes libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev
sudo apt-get install --assume-yes libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get install --assume-yes libxvidcore-dev libx264-dev
sudo apt-get install --assume-yes libgtk2.0-dev
sudo apt-get install --assume-yes libatlas-base-dev gfortran
sudo apt-get install --assume-yes python2.7-dev python3-dev

# get opencv from opencv repository via wget
cd ~
wget -O opencv.zip https://github.com/Itseez/opencv/archive/4.5.2.zip
wget -O opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/4.5.2.zip
unzip opencv.zip
unzip opencv_contrib.zip

# install pip
wget https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py

# set python3 as default python
update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# virtualenv and virtualenvwrapper
sudo pip install virtualenv virtualenvwrapper
sudo rm -rf ~/.cache/pip

# virtualenv and virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

echo -e "\n# virtualenv and virtualenvwrapper" >> ~/.profile
echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.profile
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.profile

source ~/.profile

# delete comment if using python 2
# mkvirtualenv cv -p python2
mkvirtualenv cv -p python3

source ~/.profile
workon cv

