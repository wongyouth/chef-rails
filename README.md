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

# QA

1. Exit with error message: DEBUG: chef_gem[treetop] no installed version found for treetop (>= 1.4)

That because Chef cannot get gem `treetop` installed from https://rubygems.org in China.

Workaround is to change gem sources to taobao mirror.

/opt/chef/embedded/bin/gem sources --remove https://rubygems.org/
/opt/chef/embedded/bin/gem sources --add http://ruby.taobao.org/

2. `apt-get update` caused a lot of time to complete.

Change to a mirror in China.

sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo sed -e 's/us.archive/cn.archive/' -i /etc/apt/sources.list


3. Server hanging while install chef

It's difficult to install chef within China. You can download chef client from chef.io and install directly on your server.

If you use Ubuntu, you can download a debian version of chef client. and install it by

    dpkg -i chef_12.4.0-1_amd64.deb
