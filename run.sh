#!/bin/bash
/usr/sbin/sshd

touch /var/log/spiped

ssh -oStrictHostKeyChecking=no -f -N -D 0.0.0.0:1080 localhost
/spiped/spiped/spiped -g -n 500 -d -s '[0.0.0.0]:8089' -t '[127.0.0.1]:1080' -k  /spipedkey/spiped.key

tail -f /var/log/spiped
