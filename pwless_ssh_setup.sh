#!/bin/bash


#$1 is username on remote machine
#$2 is remote machine address i.e. grex.westgrid.ca
#$3 is desired alias for remote machine
#$4 is port used for connection ( each 22xx corresponds to a different machine in the MCS network )


echo "\n" >> ~/.ssh/config
echo "Host $3" >> ~/.ssh/config
echo "    HostName $2" >> ~/.ssh/config
#echo "    Port $4" >> ~/.ssh/config
echo "    User $1" >> ~/.ssh/config

ssh $3 mkdir -p .ssh

cat ~/.ssh/id_rsa.pub | ssh $3 'cat >> .ssh/authorized_keys'

ssh $3 "chmod 700 .ssh; chmod 640 .ssh/authorized_keys"

