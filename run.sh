#!/bin/bash
/usr/sbin/sshd

ssh -oStrictHostKeyChecking=no -f -N -D 0.0.0.0:1080 localhost
/spiped/spiped/spiped -d -g -n 500 -s '[0.0.0.0]:8089' -t '[127.0.0.1]:1080' -k  /spipedkey/spiped.key

touch /var/log/spiped

tail -f /var/log/spiped
