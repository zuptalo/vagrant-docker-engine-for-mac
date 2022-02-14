## Using Vagrant to replace Docker Desktop for macOS users 

1- Uninstall Docker Desktop 

    Open Docker Desktop, select Docker menu, select Troubleshoot, select Uninstall

2- Install Brew from https://brew.sh

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


3- Install VirtualBox, Vagrant and Docker

    brew install virtualbox vagrant docker

3- Start the vagrant virtual machine by running command below

    vagrant up

4- Add line below to your .zshrc file in you home directory

    export DOCKER_HOST="tcp://0.0.0.0:2375"

5- Open a new terminal and you should be able to use docker like you used to do before.

6- Ports 10000 to 10010 are forwarded to your host in this Vagrantfile, you can change them based on your need.

7- There is a sample docker-compose.yaml file which you should be able to start, and it should give you a wordpress instance on http://localhost:10000

    docker compose up -d

8- These commands are most useful when working with this setup

    vagrant up          # to start your virtual machine
    vagrant suspend     # to suspend your virtual machine
    vagrant reload      # to restart your virtual machine, do it when changin cpu or memory configs in Vagrantfile for instance
    vagrant destroy     # to remove the virtual machine

9- The Vagrantfile is also commented, have a look there if you need more info
