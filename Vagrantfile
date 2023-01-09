Vagrant.configure("2") do |config|
    config.vm.provider "docker" do |d|
      d.image = "centos-vagrant:7"
    #   d.build_dir = "."
      d.has_ssh = true
      d.remains_running = true
      d.create_args = ["--privileged"]
    end
    config.vm.network "forwarded_port", id: "ssh", host: 2200, guest: 22
    # config.vm.provision "shell", inline: "ls -alF /run/nologin && rm -f /run/nologin"
  end