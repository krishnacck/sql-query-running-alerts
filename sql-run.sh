
############################   Configuration Files ###################################################
user=username
pass=password

############################   Emails Define Here  ###################################################
email=email@example.com,email2@example.com
subject="write your subject here"
############################   Execution Script    ###################################################

for file in *.sql; do
  echo "Executing $file.."
  
(mysql -u $user -p$pass -vvv  <"$file") 2>&1 | tee ./logs/$file.log ./logs/$file-"$(date)".log && wait && (echo "Log for $file at $(date)";cat ./logs/$file.log) | mail -s "$subject" "$email" # || break;
 
done


### This script runs the sql files upon one and another. Remove the "#" before the break, if you would like to stop your sequence of sql statements upon error
