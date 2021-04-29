# Cassandra Playbook

## Contents
This playbook has 4 tasks: install, configure, init and service.
They accomplish the following:

- Install
    - Install Java
    - Install Cassandra
- Configure
    - Create Cassandra group and user
    - Create data, commitlog, saved_caches, and log directories
    - Set up cassandra.yaml, logback.xml and .bash_profile
- Init
    - Copies the cassandra init script to
- Service
    - Starts cassandra 

## Setup 
To be able to use this playbook you must set up passwordless ssh and sudo.

- Setup passwordless ssh
    - https://askubuntu.com/questions/46930/how-can-i-set-up-password-less-ssh-login
- Setup passwordless sudo
    - Stop chef client: `sudo /etc/init.d/chef-client stop`
    - Comment out entries for `tty` in `/etc/sudoers`
    - Add user file in `/ets/sudoers.d/`
        - `sudo touch cassandra`
        - Add file contents: `cassandra ALL=(ALL) NOPASSWD:ALL`
        - If you are running it through your AD user instead of Cassandra user, you will need to do the same procedure for that

To run, cd into the cassandra-playbook folder and execute: `ansible-playbook cass.yml --ask-become-pass`

- This is the AD password you use when you sudo

## Todo
- /etc/sysctl.conf 
- /etc/security/limits.conf
- Cassandra-env.sh specifics
- Symbolic links for /opt/cassandra and /opt/jdk
