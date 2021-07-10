#!/bin/bash

# verify nginx
ufw status

# verify php
php -v

# verify composer by installing the laravel installer
composer global require laravel/installer

# check node and npm
node -v && npm -v

# check yarn version
yarn version

# copy the test files
mkdir public
chmod 777 public
cp index.html public
cp info.php public