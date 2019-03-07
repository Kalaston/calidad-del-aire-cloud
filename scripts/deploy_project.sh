#!/bin/bash
echo updating!
cd ~/calidad-del-aire-cloud
if [ -d "client" ]; then
  cd client
  git pull origin master
else
  git clone git@github.com:utec-investigaciones/calidad-del-aire-client.git client
  cd client
  docker-compose build
fi
cd ~/calidad-del-aire-cloud
if [ -d "api" ]; then
  cd api
  git pull origin master
else
  git clone git@github.com:utec-investigaciones/calidad-del-aire-api.git api
  cd api
  docker-compose build
fi
cd ~/calidad-del-aire-cloud
echo Recreating and starting!
docker-compose down
docker-compose -f docker-compose-prod.yml up -d --build --force-recreate