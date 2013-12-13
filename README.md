# Setup Server for Rails app

## Install gems

    bundle install

## Create data bag, see data_bags/users/deploy.json.example as example.

    cp data_bags/users/deploy.json.example data_bags/users/deploy.json

## Cook your recipes

    knife solo bootstrap vagrant@chefrails

# Test with Vagrant

## Setup Vagrant

    gem install vagrant
    vagrant up

## Setup ssh

    vagrant ssh-config --host chefrails >> ~/.ssh/config

