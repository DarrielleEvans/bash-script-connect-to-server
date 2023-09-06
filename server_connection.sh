#!/bin/bash
# Darrielle Evans
# September 4, 2023
# This script will allow users to send files securely to a local or remote server over ssh

echo "1 - ssh"
echo "2 - scp"
echo "Select an option to continue"
#user option will be stored in the transfer_option variable
read transfer_option
echo "Please enter remote system ip address"
# ip address will be store
read ip_address
echo "Please enter the user name"
#user name will be stored
read  user_name

if [ $transfer_option -eq 1 ]; then
    echo "Lets start the ssh process"
    #user selected ssh, We will store their username and ip address in a variable
    ssh_choice="$user_name@$ip_address"
    #user will ssh into server
    ssh $ssh_choice
elif [ $transfer_option -eq 2 ]; then
    #user will use scp to transfer file
    echo "1 - local  > Remote"
    echo "2 - remote > local"
    echo "Please choose an option."

    echo "Please enter source file location"
    read file_location
    
    echo "Please enter destination file location"
    read destination_file
    #the command to scp depends on the users option
       if [ $server_option -eq 1 ]; then
        remote_dest = “/home/$user_name@$ip_address:$destination_file
        scp $file_location remote_dest
       elif [ $server_option -eq 2 ]; then
        scp $$user_name@ip_adress:$file_location $destination_file
       fi
else 
    echo "You did not enter a valid option. Session over"
    break
 
fi
