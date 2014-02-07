# Setup Server for Rails app

## Step 1. Clone chefrails

    git clone http://github.com/wongyouth/chefrails.git

## Step 2. Install ruby gems

    cd chefrails
    bundle install

## Step 3. Prepare your databag. Create user `deploy` for deployment

    cp data_bags/users/deploy.json.example data_bags/users/deploy.json

    # Create your own password for deploy user. I use `deploy` as password in the deploy.json.example.
    openssh password -1 "your password"

    # open file below to paste created password, ssh_keys
    vi data_bags/users/deploy.json

## Step 4. Cook your recipes

    knife solo bootstrap root@your_server

It will take a couple minutes, have a cup of tea and Enjoy!

# Test with Vagrant

It's no different between vagrant server or not. The Vagrantfile file is just a basic setup which use precise64 as server.
What we need to do with Vagrant is to setup a login username and server info.

## Install [Vagrant](http://vagrantup.com)

    gem install vagrant
    vagrant up

## Setup SSH

    vagrant ssh-config --host chefrails >> ~/.ssh/config

## Same Step 1~3, for Step 4. use vagrant username and server

    knife solo bootstrap vagrant@chefrails

