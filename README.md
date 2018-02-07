# vagrant-modular

Use simple configuration for a modular VM. Develop software within this VM.

## Overview

This VM is based on Ubuntu 16.04 LTS and includes the following Tools:
* XFCE Window Manager
* git
* subversion
* german localization
* fixes for distraction free development on Ubuntu 16.04
* user account with some

After that there the VM will install some features. At the moment the following
features are included:
* LaTeX development environment
  * Full TeX Live distribution
  * Python Pygments for syntax highlighting
  * TeXstudio
  * Jabref
* Eclipse DSL Oxygen
  * with OpenJDK 8

For my personal flavor a user *martin* is created. The password configured is
 empty for obvious reasons. SSH credentials and configuration is copied form the
 data/ssh directory that is empty in this repository.

For my personal use I provision german keyboard, timezone and localization. You
can adapt this to your needs or just comment it out in the vagrant file.

Finally there are some Ubuntu-VM specific fixes. You will run into some
problems with Ubuntu Linux if you don't use them.

## Building the VM

Before you can run the VM you have to prepare the necessary tools and run the
provisioning.

### Preparation

Install [VirtualBox](https://www.virtualbox.org/) and
[vagrant](https://www.vagrantup.com/).

Install the vagrant vbguest plugin. This is used to keep the VirtualBox Guest
Additions up to date. Open a console and enter

    $ vagrant plugin install vagrant-vbguest

At this stage the preparation is done. You don't need to repeat this if you
want to rebuild the VM.

**On Windows** you might need to use a cygwin or git console, fix your PATH
variable to find vagrant and VirtualBox. Instructions will be made as soon as
the author gets access to a windows PC.

### Provisioning

Check out the Repository. On a console, cd into the directory and run

	$ ./launch.sh

on a linux host or

	> launch.bat

on a windows host respectively. This essentially installs the VM, reboots and then
reinstalls the VirtualBox Guest Additions, as the kernel module for the
graphical user interface won't be installed on the first run.

### Running the VM

After the first provisioning, you start your VM with the command

	$ vagrant up

on both linux and windows. Do not simply start the VM via VirtualBox. Vagrant
does some housekeeping on every start. You can stop the VM with

  $ vagrant halt

in the host console, but you can also just shut it down.

## License

This project is licensed under the terms of the MIT license.

For more information, see [license](LICENSE.md).
