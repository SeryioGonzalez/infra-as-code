# Azure Automation Lab

In this lab, we will build and delete a single VM using automation scripts and a template. The VM will take start-up configuration and execute it from an external blob

#Create a creentials file
In order to log in to the proper subscription, you need a file named credentials.sh with the following content, where X and Y are your IDs:

```
$ cat credentials.sh
#/bin/bash

tenant="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
subscription="YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
```
# Steps
```
#LOGIN TO AZURE
$ ./0_login.sh
To sign in, use a web browser to open the page https://microsoft.com/devicelogin and enter the code XXXXXX to authenticate.

#DEPLOY THE VM
$ ./2_deploy_vm.sh
LOGGING: Checking template JSON
LOGGING: Creating new resource group automation25053
.......

#DELETE DE RESOURCE GROUPS CREATED
$ ./3_delete.sh
LOGGING: DELETING RESOURCE GROUPS WITH PREFIX automation in name
```


