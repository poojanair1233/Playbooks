# playbooks
Documentation of Playbooks


This repository is being created to keep a log of all the ansible playbooks that I have devleoped for various use-cases.

Cassandra-Playbook
  This specific playbook to setup a cassandra cluster with one JVM per server. It uses a role based approach for setup as multiple files need modification, creation etc.
  exectuing cass.yml plyabook will initate cassandra role which turn would initiate different tasks as described in the roles.

Restart.yml
  This is a simple playbook to perform a rolling restart of cassandra cluster, check the health of cluster and proceed to next only if all nodes are up or else stop the execution of playbook if any node is found down.
  
SNMP.yml
  This is a simple playbook to check for specific snmp utility and if not present to install and perform a service reatrt of snmp

Disable_cron.yml
  This is a playbook to disable cronjobs defined.
  

  
