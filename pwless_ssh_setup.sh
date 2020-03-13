#!/bin/bash


#$1 is username on remote machine
#$2 is remote machine address i.e. grex.westgrid.ca
#$3 is desired alias for remote machine
#$4 is port used for connection ( each 22xx corresponds to a different machine in the MCS network )


exists=$(grep -c $3 ~/.ssh/config)

# apparently better than numeric comparison
if [ $exists -gt "0" ]; then
    echo "Host with provided alias already exists."
    exit
fi

re='^[0-9]+$' #regex magic


echo "Host $3" >> ~/.ssh/config
echo "    HostName $2" >> ~/.ssh/config
if [[ $4 =~ $re ]]; then
    echo "    Port $4" >> ~/.ssh/config
fi
echo "    User $1" >> ~/.ssh/config


#make this in case it doesn't exist
ssh $3 mkdir -p .ssh

cat ~/.ssh/id_rsa.pub | ssh $3 'cat >> .ssh/authorized_keys'

ssh $3 "chmod 700 .ssh; chmod 640 .ssh/authorized_keys"

