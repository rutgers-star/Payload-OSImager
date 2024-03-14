
# SPICESat Payload OSImager

![Contributors](https://img.shields.io/github/contributors/rutgers-star/Payload-OSImager) ![Last Commit](https://img.shields.io/github/last-commit/rutgers-star/Payload-OSImager) ![Stars](https://img.shields.io/github/stars/rutgers-star/Payload-OSImager) 



This Debian package is meant to serve as a way to allow the operating system on the Payload Computer to be replicated, with the goal of unified development environments between machines. With a growing developmnet team, providing each member with a uniform set of packages and base modules is essential for uniform code across the project.

## Installation

Installing this project can be done by pulling and executing the installer file from this GitHub. This can be achieved with one command in the terminal: 

```bash
sudo wget -O - https://raw.githubusercontent.com/rutgers-star/Payload-OSImager/main/installer | bash 
```

The installer will output 'SPICESat-OSImage Package Installed' and a set of commands, indicating a successful installation of the package. There may be a warning that appears after (which mentions something about not having access) but this does not affect the ability to use this package.
    
## Usage
Once installed, you can access the imager from the terminal as you would any other package

```bash
osimager [option] [other]
```

There are a set of options that you can make use of to help with the managment of your operating system. Executing `osimager` or `osimager --h` will display a help message which provides a description of all the available functionallity included. 

***

Recommended right after the package is added to the system, it is recommended to run the following commands:

```bash
osimager --u
osimager --b
osimager --pull
```
`osimager --u` will install and update all required packages from the system. When installing all packages, the most recent lists are pulled from this GitHub to ensure the most recent is used. This can also be run at any time to ensure all packages are installed and up to date. *No other commands should be run before `osimager --u` is executed for the first time.*

`osimager --pull` will pull the most up to date python modules from the [S.T.A.R. Payload Software GitHub](https://github.com/rutgers-star/PayloadSoftware). All python modules pulled from the GitHub are stored in ~/SPICESat and it is recommended that these files are kept there so that `osimager --push` can function (more about this later). 

`osimager --b` will install and compile all of the necessary components of the LibCamera package. It is recommended that building the libcamera libraries,  as errors may occur if some of the dependencies are established twice. This is not a project breaking issue in any way, however can be mildly inconvenient at times.  

***

Once this is done, the system is set up in what should be a near copy of the original system. The rest of the available commands are as follows:

```bash
osimager --i
osimager --push "Commit Message"
osimager --add
osimager --remove
osimager --login
osimager --logout
```

`osimager --add` and `osimager --remove` are used to automaticall install and uninstall new packages in the system. They use the default **apt-get** package manager to achieve this. Upon the completion of the install or delete they automatically update this GitHub with the updated list of packages on your system. These are here for convenience. If you install packages using any other package manager, they can be included in the master list by running `osimager --i` which creates and pushes the image of your os to this GitHub. Keep in mind, running this command cannot be undone. Contact the maintainer if you accidentally mess up the list, as a backup of this list is maintained in a private repository. 

`osimager --push "Commit Message"` does exactly what it says it does. It takes all the code stored in ~/SPICESat and pushes it to the [S.T.A.R. Payload Software GitHub](https://github.com/rutgers-star/PayloadSoftware). Make sure to include a commit message (in quotation marks) to go along with the push request. 

All push requests made must be done so with an account linked to the S.T.A.R. GitHub Organization. This package prompts for login credentials the first time they are needed and not provided. Alternatively, you can run `osimager --login` to provide your credentials to the system. `osimager --logout` removes these credentials and allows you to provide new ones.
## Libcamera Doccumentation

[PiCamera2 Docs](https://datasheets.raspberrypi.com/camera/picamera2-manual.pdf)

[PiCamera2](https://github.com/raspberrypi/picamera2)

[Documentation](https://github.com/raspberrypi/documentation/blob/develop/documentation/asciidoc/computers/camera/libcamera_options_common.adoc)

[Tuning](https://datasheets.raspberrypi.com/camera/raspberry-pi-camera-guide.pdf)

#### Commands:

```bash
libcamera-vid -o test.h264 --width 1920 --height 1080
libcamera-vid -t 10000  --width 640 --height 480 --sharpness 10 --contrast 2 --codec mjpeg -o test.mjpeg
libcamera-vid -t 10000  --width 640 --height 480 --sharpness 1.5 --exposure long --framerate 5 --codec mjpeg -o test.mjpeg
libcamera-vid -t 10000  --nopreview --width 640 --height 480 --sharpness 1.5 --exposure long --framerate 5 --codec mjpeg -o test.mjpeg
```

#### Python :

```python
import os os.system("ls -l")

import os os.system("libcamera-vid -t 10000  --nopreview --width 640 --height 480 --sharpness 1.5 --exposure long --framerate 5 --codec mjpeg -o test.mjpeg")
```

## Authors

- [@simon-kowerski](https://github.com/simon-kowerski)


## Maintainers 

- Simon Kowerski | kowerski8@gmail.com

