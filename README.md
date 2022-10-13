# vnios-redeploy
set of scripts and ansible playbook to automate infoblox vnios redeployment (intended for lab settings)

In a nutshell, this script will automatically take a backup of the current Infoblox appliance (vNIOS on vSphere), rename and power down the old appliance, deploy a new OVA, import the previously saved backup up (database.bak) and reload the new vNIOS.

After a few minutes, it will attempt to do a DNS resolution on the new appliance (resoves itself) to ensure it's working correctly. If so, it will delete the old VM and the script/playbook completes.

This is especially helpful in a home lab settings where you can afford to take a forced outage (10-15 mins while the script runs). With every run of this, a new 60-day license will be provisioned with the new OVA.

Note: If deploying to vCenter instead of ESXi directly, uncomment the cluster and data center fields from the vars and OVA deploy task.



### Installation Steps

1. Install Ubuntu server
  
  During install:
  - assign administrator as the username
  - Configure a static IP
  - Enable SSH
  - Complete rest of install with default settings
2. SSH into server as administrator
3. sudo apt install git -y
4. git clone https://github.com/nicholas-heaton/vnios-redeploy.git
5. Edit the Ansible playbook file variables to match your environment (use _vcenter for vCenter deployments)
6. chmod +x initialize.sh && chmod +x redeploy.sh
7. sudo ./initialize.sh
8. Download vNIOS file from Infoblox
9. SCP file over to the Ubuntu server. (Example filename: nios-8.6.2-49947-c076923293a0-2022-06-10-09-59-58-ddi.ova)
10. crontab -e

11. Add the following line to the crontab to run once a month at 3:30am

```30 3 1 * * /home/administrator/redeploy.sh```

12. Edit the redeploy.sh file using your favorite text editor and uncomment the right playbook (ESXi or vCenter).

### Note:
If you want to test the script manually, run /home/administrator/redeploy.sh
