#!/bin/bash

#Builds libcam stuff

#Creation Date: 3/11/2024
#Last Updated: 3/16/2024
#Author: Simon Kowerski :)

#Version: 1.0.1
#Assumes already in the correct directory


sudo apt install -y libcamera-dev libepoxy-dev libjpeg-dev libtiff5-dev
sudo apt install -y python3-pip git
sudo pip3 install jinja2
sudo apt install -y libboost-dev
sudo apt install -y libgnutls28-dev openssl libtiff5-dev pybind11-dev
sudo apt install -y qtbase5-dev libqt5core5a libqt5gui5 libqt5widgets5
sudo apt install -y meson
sudo apt install -y cmake
sudo pip3 install pyyaml ply
sudo pip3 install --upgrade meson

cd
git clone https://github.com/raspberrypi/libcamera.git
cd libcamera
meson build --buildtype=release -Dpipelines=rpi/vc4 -Dipas=rpi/vc4 -Dv4l2=true -Dgstreamer=disabled -Dtest=false -Dlc-compliance=disabled -Dcam=disabled -Dqcam=disabled -Ddocumentation=disabled -Dpycamera=enabled
ninja -C build
sudo ninja -C build install

sudo apt install -y libegl1-mesa-dev
cd
git clone https://github.com/anholt/libepoxy.git
cd libepoxy
mkdir _build
cd _build
meson
ninja
sudo ninja install

sudo apt install -y cmake libboost-program-options-dev libdrm-dev libexif-dev
sudo pip3 install ninja meson
cd
git clone https://github.com/raspberrypi/libcamera-apps.git
cd libcamera-apps
meson setup build -Denable_libav=true -Denable_drm=true -Denable_egl=false -Denable_qt=false -Denable_opencv=false -Denable_tflite=false
meson compile -C build
sudo meson install -C build
sudo ldconfig

#move folders int ~/libcamera-build
cd ~
mkdir libcamera-build
cp -r libcamera libcamera-build/
cp -r libcamera-apps libcamera-build/
cp -r libepoxy libcamera-build/
sudo rm -r libcamera
sudo rm -r libcamera-apps
sudo rm -r libepoxy
