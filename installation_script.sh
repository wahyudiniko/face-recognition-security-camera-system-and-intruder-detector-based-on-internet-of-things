#!/bin/bash

# update and upgrade os
sudo apt-get update 
sudo apt-get -y upgrade

sudo apt-get install -y vim
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
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# virtualenv and virtualenvwrapper
sudo pip install virtualenv virtualenvwrapper
sudo rm -rf ~/.cache/pip

echo -e "\n# virtualenv and virtualenvwrapper" >> ~/.profile
echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.profile
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.profile

source ~/.profile

# if using python 2
# mkvirtualenv cv -p python2
mkvirtualenv cv -p python3

source ~/.profile
workon cv

pip install numpy

workon cv

cd ~/opencv-4.5.2/
mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D INSTALL_PYTHON_EXAMPLES=ON \
-D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-4.5.2/modules \
-D BUILD_EXAMPLES=ON ..

make
sudo make install
sudo ldconfig

ls /usr/local/lib/python3.7/site-packages/cv2/python-3.7/
cd /usr/local/lib/python3.7/site-packages/cv2/python-3.7/
sudo mv cv2.cpython-37m-arm-linux-gnueabihf.so cv2.so

cd ~/.virtualenvs/cv/lib/python3.7/site-packages/
ln -s /usr/local/lib/python3.7/site-packages/cv2/python-3.7/cv2.so cv2.so

source ~/.profile
workon cv

python test_cv2.py
