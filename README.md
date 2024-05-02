# As of 5/1/2024 errors have been found and this package is not safe to run on established os installs. DO NOT ATTEMPT TO USE IT. If you have a fresh install of Ubuntu it does work, but otherwise it is not worth risking the loss of your data. 


# SPICESat Payload OSImager ![Last Commit](https://img.shields.io/github/last-commit/rutgers-star/Payload-OSImager) ![Contributors](https://img.shields.io/github/contributors/rutgers-star/Payload-OSImager) ![Release Version](https://img.shields.io/github/v/release/rutgers-star/Payload-OSImager)



This Debian package is meant to serve as a way to allow the operating system on the Payload Computer to be replicated, with the goal of unified development environments between machines. With a growing developmnet team, providing each member with a uniform set of packages and base modules is essential for uniform code across the project.

## Installation

Installing this project can be done by pulling and executing the installer file from this GitHub. This can be achieved with one command in the terminal: 

```bash
sudo wget -O - https://raw.githubusercontent.com/rutgers-star/Payload-OSImager/main/installer | bash 
```

The installer will output 'SPICESat-OSImage Package Installed' and a set of commands, indicating a successful installation of the package. There may be a warning that appears after (which mentions something about not having access) but this does not affect the ability to use this package.
    
## Usage
Once installed, you can access the imager from the terminal as you would any other package

```text
osimager [option] [other]
--h 			display this message
--i 			creates an image of this operating system and pushes it to GitHub **CANNOT BE UNDONE**
--u			installs and upgrades all packages in the remote list of packages
--b			installs all dependencies for and builds the libcamera library *should only be done once*

--add [package]		adds a new package to this operating system AND the remote list of packages
				[package] will be installed using sudo apt install [package]
--add pip [package]	functions the same as above but used to install a python package using pip not apt

--remove [package] 	removes a package from this operating system and the remote list of packages
--remove pip [package]	functions the same as above but user to remove a python package using pip not apt

--pull 			pulls Pyhton modules from the GitHub and stores them in ~/SPICESat
--push [commit] 	pushes Python modules from ~/SPICESat into GitHub with commit message [commit] 
				[commit] must be in quotation marks 

--login			prompts user to enter GitHub login credentials and updates the GLOBAL data on the computer
				git credentials must have access to the S.T.A.R. organization
--logout		removes user's GitHub credentials

--v			updates this (osimager) package to the latest version
```

There are a set of options that you can make use of to help with the managment of your operating system. Executing `osimager` or `osimager --h` will display a help message which provides a description of all the available functionallity included. 

### "Cloning" the OS
Right after the package is added to the system, it is recommended to run the following commands:

```bash
osimager --u
osimager --b
osimager --pull
```
`osimager --u` will install and update all required packages from the system. When installing all packages, the most recent lists are pulled from this GitHub to ensure the most recent is used. This can also be run at any time to ensure all packages are installed and up to date. *No other commands should be run before `osimager --u` is executed for the first time.*

`osimager --pull` will pull the most up to date python modules from the [S.T.A.R. Payload Software GitHub](https://github.com/rutgers-star/PayloadSoftware). All python modules pulled from the GitHub are stored in ~/SPICESat and it is recommended that these files are kept there so that `osimager --push` can function (more about this later). 

`osimager --b` will install and compile all of the necessary components of the LibCamera package. It is recommended that building the libcamera libraries,  as errors may occur if some of the dependencies are established twice. This is not a project breaking issue in any way, however can be mildly inconvenient at times.  

The above commands can be run at any time to keep your personal image of the OS up to date.

### Keeping external images up to date

Once this is done, the system is set up in what should be a near copy of the original system. The rest of the available commands are as follows:

```bash
osimager --i
osimager --push "Commit Message"
osimager --add
osimager --add pip
osimager --remove
osimager --remove pip
osimager --login
osimager --logout
```

`osimager --add` and `osimager --remove` are used to automaticall install and uninstall new packages in the system. They use the default **apt-get** package manager to achieve this. Upon the completion of the install or delete they automatically update this GitHub with the updated list of packages on your system. The pip option included for each of these commands allows you to install python packages in the same manner using pip instead of apt-get. All of these are here for convenience. If you install packages using any other package manager, they can be included in the master list by running `osimager --i` which creates and pushes the image of your os to this GitHub. This master list image includes all packages installed on the Ubuntu operating system as well as all those installed on pip. Keep in mind, running the `osimager --i` command cannot be undone. Contact the maintainer if you accidentally mess up the list, as a backup of this list is maintained in a private repository. 

`osimager --push "Commit Message"` does exactly what it says it does. It takes all the code stored in ~/SPICESat and pushes it to the [S.T.A.R. Payload Software GitHub](https://github.com/rutgers-star/PayloadSoftware). Make sure to include a commit message (in quotation marks) to go along with the push request. 

All push requests made must be done so with an account linked to the S.T.A.R. GitHub Organization. This package prompts for login credentials the first time they are needed and not provided. Alternatively, you can run `osimager --login` to provide your credentials to the system. `osimager --logout` removes these credentials and allows you to provide new ones.

### Updating the osimager package
```bash
osimager --v
```

This command will update the osimager package to the latest version. Makes use of the debian file found in this GitHub. There may be commits to the GitHub that are not reflected in these updates, as the debian file has not yet been updated. Any commits made after the [latest release](https://github.com/rutgers-star/Payload-OSImager/releases/latest) will not be reflected in these updates. When a new version is released, the .deb file will be updated allowing for distributions of the software to be updated as well.

## Uninstalling the package

This package is installed using standard package managers. Executing the following command in the terminal will remove the package in its entirety from the system

```bash
sudo apt remove spicesat-osimage
```

## Libcamera Doccumentation

[PiCamera2 Docs](https://datasheets.raspberrypi.com/camera/picamera2-manual.pdf)

[PiCamera2](https://github.com/raspberrypi/picamera2)

[Documentation](https://github.com/raspberrypi/documentation/blob/develop/documentation/asciidoc/computers/camera/libcamera_options_common.adoc)

[Tuning](https://datasheets.raspberrypi.com/camera/raspberry-pi-camera-guide.pdf)

#### Commands

```bash
libcamera-vid -o test.h264 --width 1920 --height 1080
libcamera-vid -t 10000  --width 640 --height 480 --sharpness 10 --contrast 2 --codec mjpeg -o test.mjpeg
libcamera-vid -t 10000  --width 640 --height 480 --sharpness 1.5 --exposure long --framerate 5 --codec mjpeg -o test.mjpeg
libcamera-vid -t 10000  --nopreview --width 640 --height 480 --sharpness 1.5 --exposure long --framerate 5 --codec mjpeg -o test.mjpeg
```

#### Python

```python
import os os.system("ls -l")

import os os.system("libcamera-vid -t 10000  --nopreview --width 640 --height 480 --sharpness 1.5 --exposure long --framerate 5 --codec mjpeg -o test.mjpeg")
```

## Authors

- [@simon-kowerski](https://github.com/simon-kowerski)


## Maintainers 

- Simon Kowerski | kowerski8@gmail.com

