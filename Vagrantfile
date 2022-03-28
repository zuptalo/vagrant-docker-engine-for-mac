Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = "docker-engine"                                  # hostname of the virtual machine
  config.vm.network "forwarded_port", guest: 2375, host: 2375           # forwarding docker port to the host, don't change this!

  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder "./logs", "/logs", owner: "root", group: "root", mount_options: ["dmode=777,fmode=777"]

  config.vm.network "forwarded_port", guest: 80, host: 10000            # you can forward a port that you need
  config.vm.network "forwarded_port", guest: 3306, host: 10001          # you can forward a port that you need

  for i in 10002..10010                                                 # you can forward a range of ports like this
      config.vm.network :forwarded_port, guest: i, host: i
  end

  config.vm.provision "shell", path: "provision.sh"                     # the provisioning script used to install docker and expose it's port
  config.vm.provider :virtualbox do |vb|
      vb.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]   # disabling the log file generation on host
      vb.name = "docker-engine"                                         # virtual machine name in virtualbox
      vb.memory = 2048                                                  # your virtual machine's memory, adjust based on you need
      vb.cpus = 2                                                       # your virtual machine's cpu, adjust based on you need
  end
end
