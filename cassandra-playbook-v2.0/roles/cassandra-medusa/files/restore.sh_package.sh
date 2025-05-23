#!/usr/bin/bash
LOGFILE="/var/log/medusa/restore.log-$(date +'%d-%m-%Y')"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
EMAIL="email-id"  # Replace with your actual email address

{
    echo "$(date "+%Y-%m-%d %H:%M:%S") Starting restore..."

    # Example backup command – replace with your actual command
    medusa -vvv --prefix "<prefix name>" --fqdn <source node> restore-node --remote --backup-name <backup-name> --seeds <seed node> --temp-dir <temp dir for restore>  || {
        echo "$(date "+%Y-%m-%d %H:%M:%S") ERROR: Restore failed" >> "$LOGFILE"

        # Send email notification on failure
        echo -e "Subject: Restore Failed\n\nThe Medusa restore failed on $(hostname) at $(date "+%Y-%m-%d %H:%M:%S").\nCheck the restore logs for more details." | mail -s "Restore Failure Notification" "$EMAIL"

        exit 1
    }
  sleep 30
    CASS_PROC=$(ps -ef | grep cassandra | grep -v 'color' | awk '{print $2}')
   if [ -z "$CASS_PROC" ]; then
           echo 'Cassandra did not start post restore, please check the cassandra logs'
           exit 1
   fi

   echo "$(date "+%Y-%m-%d %H:%M:%S") Restore completed successfully"
} >> "$LOGFILE" 2>&1
