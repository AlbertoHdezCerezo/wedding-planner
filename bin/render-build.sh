#!/usr/bin/env bash

# Script to build project & deploy in Render
# ------------------------------------------

# exit on error
set -o errexit

# 1. Install dependencies
bundle install

# Run migrations
./bin/rails db:create db:migrate

# Compile assets
yarn install --pure-lockfile
yarn build
./bin/rails assets:precompile
./bin/rails assets:clean
