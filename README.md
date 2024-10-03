# Server Post Install For Ubuntu

This script is an interactive wizard, which prepares Ubuntu server for use.

# Installation and Usage

* ssh to server
* su to root
* download release from github
* unpack and start script `./ubp`

# Modules

The script is divided into logical parts, each providing different functionality in the server setup

## Admin

This module will create a designated user admin, who will be the only user authorized to access this server via ssh. If the admin user already exists because it was created during the installation of the operating system, you still need to provide this username to allow this user to connect to the server via ssh in the next step.

## Essentials

Basic packages installation from the default repository.

## Hardening

This module is mandatory and will do a few things:

* disable ssh access for root
* change default ssh port
* allow only admin user for ssh access

This module restarts sshd service, so start script from the console, rather than ssh connection.

## Physical Server

Pick this option if the server is physical in order to setup lmsensors

## OVPN Server

Currently unavailable, will be added in the future.

## File Server

This module prepares server for exporting NFS shares.

* nfs-kernel-server

## Docker Server

This module is optional and you will be asked whether you want to install it.

* docker
* docker compose
* nginx proxy manager

## LUKS encryption

This module will ask you to point drive to be formatted, LUKS encrypted and set for auto decryption on boot (this option is not finished yet).

Script will delete up to 4 existing partitions, but it will not delete any existing LUKS partitions, so keep that in mind and delete them manually, if any, before you execute the script.

# LUKS key files and startup script

Script is located in `/home/<admin>/startup.sh` location. Purpose of this script is to decrypt luks volumes and to mount them by manual execution of this script instead of using crypttab, which may compromise your key files when someone just mounts system drive and takes them.

That makes sense in case of physical servers, where drives can be stolen and mounted somewhere else. It doesn't make sense in case of micro cloud instances, which are usually too weak to even encrypt cryfs folder.

Note, that in the current version (alpha 2.0) keys are not encrypted by default, so you have to take care of them yourself and possibly alter the script, so it will decrypt keys first and than use them.

---

# Known Issues & Future Plans

To fix

- [ ] - during the second run of script, luks keys are generated in /home/luks instead of /home/adminuser - read adminuser name from files in lock folder
- [ ] - create build metric file with info like date of build, path to store dumps, chosen options during build run
- [ ] - change ownership of created mountpoints to admin user
- [ ] - if the server is physical, create a startup script, if it is virtual add luks to crypttab (or maybe leave decission to user)
- [ ] - conssider creating fuctionality of changing default docker containers location
