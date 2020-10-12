#!/bin/bash
chmod 600 id_rsa*
ssh-add id_rsa
basePath=$(pwd)
if [ -d "./PMS-ENV" ]; then
cd PMS-ENV
git pull
else
git clone felix-huang@vs-ssh.visualstudio.com:v3/felix-huang/PMS/PMS-ENV
cd PMS-ENV
fi
. ./initialize.sh
cd $basePath
docker build -f ./pms-biz-env-dockerfile -t pms/pms-biz-env:v1 .
