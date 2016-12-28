======
PI-MPD
======

Introduction
============

TL;DR : This project aims at building a MPD server on Raspberry Pi. I have a Hifiberry DAC (not DAC+) on top of the RPI, but I think this would work without. Sound is just better with it. Output is sent to my amplifier.

Distribution choice
===================

After a first succesful attempt on arch, project was working. But after some system update, everything went off. I never managed to make my set up work again. I tried to switch on raspbian but without any better success. I then found the volumio project (https://volumio.org/). It meets my basic rules (mpd server on rpi using hifiberry DAC) and adds some more (web interface). It is not based on arch but nevermind it works.

Installation
============

Installation is based on my pi-arch project. It uses volumio and is adapted. All you need to know know is the name of the device for your SD card and run ::

 makeSd /dev/sdcarddevice

It will download the latest volumio and put it on the SD card. You can then take the card and plug it in the RPI. Default connection is made with user volumio, passsword volumio. Up to you to change this.

A few more steps are mandatory.

wlan connection
---------------

If you plan to use a wlan connection, run the following ::

 wpa_passphrase <SSID> <passphrase> >> /etc/wpa_supplicant/wpa_supplicant.conf

On next boot, you should be connected.

stay up to date
---------------

upgrade your kernel using the raspbian procedure ::

 sudo rpi-update

change the password and allow sudo nopasswd
-------------------------------------------

"volumio" is a bad password to keep for a user named "volumio". It is best for the distribution but must be changed on your system. Run the following command and set a good password (https://xkcd.com/936/) ::

 passwd

Once your user has better password, allow yourself more power ::

 sudo sed -i '/^volumio ALL=(ALL) NOPASSWD: /d' /etc/sudoers
 sudo sed -i -r 's/^(volumio ALL=\(ALL\)) (ALL)$/\1 NOPASSWD: \2/' /etc/sudoers

ansible
-------

As long as we are going to use ansible on the RPI, we will connect with ssh multiple times. Copying the public key may be a good choice. From your computer ::

 ssh-copy-id volumio@pi-mpd

Although it is not intrusive, ansible still have some pre-requisite : having python installed on the distant machinee (i.e. the RPI). Volumio has python installed as a default.

Run Ansible
===========

Simply run the following ::

 ansible-playbook -i hosts playbook.yml
