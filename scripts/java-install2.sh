#!/bin/bash

set -e

CONTAINER_ID=$1
LIBRARY_NAME=$(ctx node properties lib_name)

set +e
   Yum=$(sudo docker exec -it ${CONTAINER_ID} which yum)
   Apt=$(sudo docker exec -it ${CONTAINER_ID} which apt-get)
set -e

      
    if [[ -n "${Yum}" ]]; then
        set +e
	   java=$(sudo docker exec -it ${CONTAINER_ID} rpm -qa java)
        set -e
	if [[ -z ${java} ]]; then
	echo "yum"
	 #sudo docker exec -it ${CONTAINER_ID} yum -y update
	 sudo docker exec -it ${CONTAINER_ID} yum -y install java-1.7.0-openjdk
	fi
    fi
    #else 
        if [[ -n "${Apt}" ]]; then
           echo "java"
           set +e
            java=$(sudo docker exec -it ${CONTAINER_ID} which java)
           set -e
           if [[ -z ${java} ]]; then
	      if [[ ${LIBRARY_NAME} == 'openjdk-8-jdk' ]]; then
                 sudo docker exec -it ${CONTAINER_ID} apt-get update
                 sudo docker exec -it ${CONTAINER_ID} apt-get install -y software-properties-common
                 echo "install repo"
                 sudo docker exec -it ${CONTAINER_ID} apt-add-repository -y ppa:openjdk-r/ppa
              fi
      echo "install java"        
              sudo docker exec -it ${CONTAINER_ID} apt-get update
              sudo docker exec -it ${CONTAINER_ID} apt-get install -y ${LIBRARY_NAME}
           fi
        fi
  
