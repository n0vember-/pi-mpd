1. being able to ssh root@pi-mpd (based on pi-arch project based machine)
2. ssh root@pi-mpd pacman -S python
3. verify with : ansible -i hosts all -m ping --ssh-common-args='-l root'
4. run : ansible-playbook -i hosts all.yml
