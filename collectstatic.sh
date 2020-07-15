#!/bin/bash

# init python env
source ./venv/bin/activate || true

# remove old static
rm -rf ./shop/assets
rm -rf ./nginx/var/
mkdir -p ./nginx/var/www/web

# generate new static
pushd shop
python manage.py collectstatic
popd

# add static to nginx container folder
mv ./shop/assets ./nginx/var/www/web/assets

# build images
#docker-compose -f docker-compose-prod.yml build
#docker-compose -f docker-compose-prod.yml up
