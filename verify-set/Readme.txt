1 : Run Playbook to check status of nodetool command

ansible-playbook --extra-vars "checkstatus='<user input command>'" -i inventory -u <adsid> -k verify-set.yml

2 : Run playbook to check and set the nodetool command

ansible-playbook --extra-vars "checkstatus='<user input check command>' setstatus='<user input set command>'" -i inventory -u <adsid> -k verify-set.yml
