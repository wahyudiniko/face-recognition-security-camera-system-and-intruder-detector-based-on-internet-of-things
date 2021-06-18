#!/bin/bash

# update and upgrade os
sudo apt-get update
sudo apt-get upgrade

# dependencies
sudo apt-get install build-essential cmake pkg-config
sudo apt-get install libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get install libxvidcore-dev libx264-dev
sudo apt-get install libgtk2.0-dev
sudo apt-get install libatlas-base-dev gfortran
sudo apt-get install python2.7-dev python3-dev

# get opencv from opencv repository via wget
cd ~
wget -O opencv.zip https://github.com/Itseez/opencv/archive/4.5.2.zip
wget -O opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/4.5.2.zip
unzip opencv.zip
unzip opencv_contrib.zip

# virtualenv and virtualenvwrapper
sudo pip install virtualenv virtualenvwrapper
sudo rm -rf ~/.cache/pip
echo -e "\n# virtualenv and virtualenvwrapper" >> ~/.profile
echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.profile
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.profile

source ~/.profile

# delete comment if using python 2
# mkvirtualenv cv -p python2
mkvirtualenv cv -p python3

source ~/.profile
workon cv

