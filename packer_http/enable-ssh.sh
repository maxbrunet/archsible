#!/bin/sh

echo "==> Enabling SSH"
echo 'root:vagrant' | chpasswd
/usr/bin/systemctl start sshd.service
