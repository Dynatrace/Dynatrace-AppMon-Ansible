#!/bin/bash

sudo yum install -y \
  epel-release \
  git \
  net-tools \
  tree \
  mlocate \
  vim-enhanced \
  wget \
  zsh

sudo yum update -y

#install IUS, which stands for Inline with Upstream Stable. A community project, IUS provides Red Hat Package Manager (RPM) packages for some newer versions of select software

sudo yum -y install https://centos7.iuscommunity.org/ius-release.rpm
sudo yum -y install python36u

sudo yum -y install python36u-pip \
  python36u-devel

# Install Ansible
#sudo yum install -y ansible

# Get oh my zsh its what the cool kids are using
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Set shell to zsh
sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh

# Our zsh theme
sudo updatedb
ZSHFILE=`sudo locate '.zshrc'`
sudo sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="ys/g' $ZSHFILE
