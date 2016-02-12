#!/bin/bash

set -e
CONTAINER_ID=$1
Lib_URL=$(ctx node properties lib_URL)
Lib_Path=$(ctx node properties lib_path)
Lib_name=$(ctx node properties lib_name)

set +e
  Wget=$(which wget)
set -e

	if [[ -z ${Wget} ]]; then
         	sudo apt-get update
  	        sudo apt-get -y install wget
        fi

[ ! -d ~/Picard/${Lib_Path} ] && mkdir ~/Picard/${Lib_Path}
[ ! -f ~/Picard/${Lib_Path}/${Lib_name} ] && wget -O ~/Picard/${Lib_Path}/${Lib_name} ${Lib_URL}

sudo docker exec -it ${CONTAINER_ID} chmod -R 777 root/Picard/${Lib_Path}/${Lib_name}
sudo docker exec -it ${CONTAINER_ID} cp -r root/Picard/${Lib_Path} .


