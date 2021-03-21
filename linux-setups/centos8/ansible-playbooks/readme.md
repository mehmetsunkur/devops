the order of inital setup of new server
ansible-playbook -i server1.example.com, -u root make-known-hosts.yml 
ansible-playbook -i server1.example.com, -u root dnf-update-and-reboot/yum_update_reboot.yml 
ansible-playbook -i server1.example.com, setup-devops-user/playbook.yml -u root
ansible-playbook -i server1.example.com, setup-devops-user/disk-warmup-cron.yml
ansible-playbook -i server1.example.com, install-docker/playbook.yml
ansible-playbook -i server1.example.com, install-docker-compose/playbook.yml
