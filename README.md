# vnios-redeploy
set of scripts and ansible playbook to automate infoblox vnios redeployment (intended for lab settings)


1. Install Ubuntu server
  During install:
  - assign administrator as the username
  - Configure a static IP
  - Enable SSH
  - Complete rest of install with default settings
2. SSH into server as administrator
3. sudo apt install git -y
4. git clone https://github.com/nicholas-heaton/vnios-redeploy.git
5. Edit the Ansible playbook file variables to match your environment
6. chmod +x initialize.sh && chmod +x redeploy.sh 
7. crontab -e
## Add the following line to the crontab to run once a month at 3:30am
30 3 1 * * /home/administrator/redeploy.sh

Note:
If you want to test the script manually, run /home/administrator/redeploy.sh
