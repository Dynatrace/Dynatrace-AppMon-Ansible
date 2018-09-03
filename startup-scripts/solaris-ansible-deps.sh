#!/usr/bin/env bash
# Installs zsh, python, ansible

pkgadd -d http://get.opencsw.org/now # add repo
/opt/csw/bin/pkgutil -U all # update all
/opt/csw/bin/pkgutil -y -i zsh
/opt/csw/bin/pkgutil -y -i python
/opt/csw/bin/pkgutil -y -i ansible
/opt/csw/bin/pkgutil -y -i jdk7


# list files
/usr/sbin/pkgchk -L CSWzsh
/usr/sbin/pkgchk -L CSWpython
/usr/sbin/pkgchk -L CSWansible
/usr/sbin/pkgchk -L CSWjdk7

sudo mkdir -p /etc/profile.d/
sudo cp startup-scripts/java-env.sh /etc/profile.d/
