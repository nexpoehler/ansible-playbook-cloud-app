Nexcess Cloud Application Playbooks
===================================

# Overview
The Ansible playbooks used here are meant for environment creation and code deployment for projects based on the Nexcess Application Cloud.  These playbooks are typically used with dynamic inventory created by Nexcess' cloud deployment system and typical targets are Vagrant or Nexcess' Application Cloud itself.

# Environment Creation
Environemnt creation is handled by the environment playbook.  The playbook is structured such that all services are deployed in a service oriented manner (one service per VM).  You should be able to combine services onto less VMs by massaging the inventory.

# Code Deployment
Code deploys are done via the deploy playbook.

# License
MIT