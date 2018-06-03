#!/bin/bash -e

lxc exec TPwildfly -- apt update
lxc exec TPwildfly -- apt -y upgrade
lxc exec TPwildfly -- apt -y install openssh-server python sudo
lxc exec TPwildfly -- adduser wildfly
lxc exec TPwildfly -- usermod -a -G sudo wildfly
lxc restart TPwildfly
