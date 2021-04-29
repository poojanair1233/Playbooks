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
    - Starts service
