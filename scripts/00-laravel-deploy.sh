#!/usr/bin/env bash

echo "Running composer"
composer global require hirak/prestissimo
composer install --no-dev --working-dir=/var/www/html
composer --version 
composer self-update --force

echo "Clearing caches..."
php artisan optimize:clear

echo "generating application key..."
php artisan key:generate --show

echo "Caching config..."
php artisan config:cache

echo "Caching routes..."
php artisan route:cache

echo "Running migrations..."
php artisan migrate --force

echo "Running migrations..."
php artisan migrate --seed --force


echo "done deploying"
