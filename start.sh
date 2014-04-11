#!/bin/bash

cd /var/www

echo "Starting application"

export MONGODB_URL="mongodb://${MONGODB_PORT_27017_TCP_ADDR}/example-project"

forever -w keystone.js
