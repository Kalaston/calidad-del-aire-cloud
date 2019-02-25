#!/bin/bash
echo updating!
cd ~/calidad-del-aire-cloud
if [ -d "client" ]; then
  cd client
  sudo git pull origin master
else
  sudo git clone git@github.com:utec-investigaciones/calidad-del-aire-client.git client
  cd client
  sudo docker-compose build
fi
cd ~/calidad-del-aire-cloud
if [ -d "api" ]; then
  cd api
  sudo git pull origin master
else
  sudo git clone git@github.com:utec-investigaciones/calidad-del-aire-api.git api
  cd api
  sudo docker-compose build
fi
cd ~/calidad-del-aire-cloud
echo Recreating and starting!
sudo docker-compose down
sudo docker-compose -f docker-compose-prod.yml up -d --build --force-recreate