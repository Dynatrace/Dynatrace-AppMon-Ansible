#!/usr/bin/env bash
# Installs zsh, python, ansible

# vars
ENV_FILE="/etc/profile"
USER_ENV_FILE="/export/home/vagrant/.profile"
# add repo
pkgadd -d http://get.opencsw.org/now # add repo
/opt/csw/bin/pkgutil -U all # update all
# install stuff
echo "Installing stuff ---->"
/opt/csw/bin/pkgutil -y -i curl
/opt/csw/bin/pkgutil -y -i zsh
/opt/csw/bin/pkgutil -y -i python
/opt/csw/bin/pkgutil -y -i ansible
/opt/csw/bin/pkgutil -y -i vim
# /opt/csw/bin/pkgutil -y -i jdk8
#
# # set java home
#
# cat <<EOF >> $ENV_FILE
#   export JAVA_HOME=/opt/csw/java/jdk/jdk8/
#   export PATH=$PATH:$JAVA_HOME:bin:$JAVA_HOME/jre/bin
# EOF
#
# cat <<EOF >> $USER_ENV_FILE
#   export JAVA_HOME=/opt/csw/java/jdk/jdk8/
#   export PATH=$PATH:$JAVA_HOME:bin:$JAVA_HOME/jre/bin
# EOF

# source $ENV_FILE
# java -version
