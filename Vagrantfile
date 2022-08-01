Vagrant.configure("2") do |config|
    config.vm.provider "docker" do |d|
      d.image = "centos-7-sd"
    #   d.build_dir = "."
      d.has_ssh = true
      d.remains_running = true
      d.create_args = ["--privileged"]
    end
    # config.vm.provision "shell", inline: "ls -alF /run/nologin && rm -f /run/nologin"
  end