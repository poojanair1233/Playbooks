### Usage of playbook ####
Step 1 : Set the role that you want to use in the main.yml file name "cass.yml" --- [cassandra-package][cassandra-tar][cassandra-medusa]
Step 2 : Set the host list in the host file and respective variables for the respective role which can found in roles>>[role-name]>>[vars]>>main.yml

######## FOR CASSANDRA INSTALLATION ###########

Step 3 : Run the playbook with the following tag "always" and skip other tags for intital cluster installation tasks like >> install_java,setup directories,kernel parameters,install cassandra
         
        Example for tar installation:
           ansible-playbook -i hosts cass.yml --tags "always" --skip-tags "pps,comm,idea,lab,myss,myss1,mws"
        
       Example for package installation
          ansible-playbook -i hosts cass.yml --tags "always" --skip-tags "chronicle,fe"


Step 4: Run the playbook with the respective tag "<name of the cluster > pps,comm,idea,lab,myss,chronicle,fe"  to configure cassandra for selected cluster 
        
       Example of tar-installation cluster 
         ansible-playbook -i hosts cass.yml --skip-tags "always" --tags "labs"
       
       Example of package installation cluster
         ansible-playbook -i hosts cass.yml --skip-tags "always" --tags "fe"


######### FOR CASSANDRA-MEDUSA INSTALLATION #############

Step 3: In config.yml present in roles >>cassandra-medusa >>tasks >>config.yml , make change to the backup.sh script according to the cassandra installation type. For Tar ball installation use backup_tar.sh.j2 and for package use backup.sh.j2 respectively

Step 4: Run the playbook as below. This will download, install and configure cassandra-medusa.Setup backup script, install mail utility and schdeule cronjob for the backup.

       ansible-playbook -i hosts cass.yml

