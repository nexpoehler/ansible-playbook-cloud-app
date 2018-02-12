VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "centos/7"
    config.vm.hostname = "vagrantbox"
    
    provisioner = Vagrant::Util::Platform.windows? ? :ansible_local : :ansible

    config.vm.network :forwarded_port, host: 80, guest: 80, auto_correct: true # website
    config.vm.network :forwarded_port, guest: 443, host: 443, auto_correct: true # ssl
    config.vm.network :forwarded_port, guest: 3306, host: 3306, auto_correct: true # mysql
    config.vm.network :private_network, ip: "10.0.0.10"

    config.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.customize ['modifyvm', :id, '--memory', '1024']
        vb.customize ["modifyvm", :id, "--cpus", "1"]
        vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
    end

    config.vm.provision "shell" do |s|
        s.path = "vagrant/setup.sh"
    end
    
    config.vm.provision provisioner do |ansible|
        ansible.playbook = "playbooks/environment.yml"
        ansible.become = true
        ansible.galaxy_role_file = 'requirements.yml'
        ansible.limit = "all"
        ansible.inventory_path = "./vagrant/inventory.ini"
        ansible.raw_arguments = [
          "--extra-vars @vagrant/env-vars.yml",          
        ]
    end

    config.vm.provision :shell, inline: "echo Good job, now enjoy your new vbox: http://10.0.0.10"

end
