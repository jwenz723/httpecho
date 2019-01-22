# httpecho

A simple golang http app that prints out whatever was received at /echo

This project is mainly intended to be used as a simple app to be deployed when testing with various deployment strategies.

## Ansible

Ansible can be used to automate the deployment to a host. Specify the hosts to deploy to in the ansible/hosts file then run:
```
ansible-playbook playbook.yaml
```
