Nexcess Cloud Application Playbooks
===================================
# Overview
The Ansible playbooks used here are meant for environment creation, application build creation, and application code deployment for projects based on the Nexcess Application Cloud.  These playbooks are typically used with dynamic inventory created by Nexcess' cloud deployment system and typical targets are Vagrant or Nexcess' Application Cloud itself.

# The Playbooks
## 1. playbooks/environment.yml
Environment creation is the first step towards application deployment on the Nexcess Application Cloud.  This step installs, configures, and connects the various virtual machines that will be utilized by the application. The playbook is structured such that all services are deployed in a service oriented manner (one service per VM).

### Environment Creation Variables
#### Required Variables
The variables listed below must be defined at playbook runtime, via the --extra-vars@[yamlfile] ansible-playbook option.

    # The Nexcess Application Ansible Role to be Deployed
    nex_app: nexcess.magento2

    # The Application Domain Name to Associate with this Environment
    nex_app_domain: example.nexcess.net

#### Example Usage
    ansible-playbook -i inv.ini --extra-vars @env-vars.yml playbooks/environment.yml

## 2. playbooks/build.yml
Build creation is the second step towards application deployment on the Nexcess Application Cloud.  This step takes a git repository and branch, runs application and branch specific tasks to turn the checked-out code into a ready-to-be-deployed application code base.

### Build Creation Variables
#### Required Variables
The variables listed below must be defined at playbook runtime, via the --extra-vars@[yamlfile] ansible-playbook option.

    # The Nexcess Application Ansible Role to be Deployed
    nex_app: nexcess.magento2
	
    # The git repository where application code resides
	nex_app_git_repo: 'git@github.com:[user]/[repo-name].git'
	
	# The git repository branch where application code resides
	nex_app_git_branch: master
	
	# The build id is a unique string that will be used to identify this build at deploy-time
	nex_app_build_id: [unique identifier]

#### Common Variables
The variables listed below may or may not be required for successful build creation, based on the application being built, but are common enough to warrant mentioning.

    # Application Database User Name
	nex_app_db_user: [db user name]
	
	# Application Database Name
    nex_app_db_name: [db name]
	
	# Application Database Password
	nex_app_db_pass: [password]
See documentation for the application ansible role for other role-specific variable requirements and options.

## 3. playbooks/deploy.yml
Deployment is the and final step when deploying an application on the Nexcess Application Cloud.  This step takes a build id string used to identify a previously created application build, and then deploys the build into live use on the application servers.

### Deployment Variables
#### Required Variables
The variables listed below must be defined at playbook runtime, via the --extra-vars@[yamlfile] ansible-playbook option.

    # The Nexcess Application Ansible Role to be Deployed
    nex_app: nexcess.magento2

    # The Application Domain Name to Associate with this Environment
    nex_app_domain: example.nexcess.net

    # The build id is a unique string that will identify a previously created build
    nex_app_build_id: [unique identifier]
See documentation for the application ansible role for role-specific variable requirements and options.

# License
MIT
