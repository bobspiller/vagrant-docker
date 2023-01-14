# Vagrant capable Docker Images

The project defines a set of Docker images which are configured to run as 
[Vagrant](https://vagrantup.com) "VM"s via the 
[Docker provider](https://developer.hashicorp.com/vagrant/docs/providers/docker).
The configuration in fact goes a bit beyone what is required to run in Vagrant as 
my intention is to use these images as the basis of setting up sandbox linux clusters 
for testing [Ansible](https://docs.ansible.com/) based configuration management collections.

## Supported container images

* CentoOS 7
* Rocky Linux 9

## Vagrant requirements

* A `vagrant` user and a `vagrant` group
* The `vagrant` user's password set to the default password
* `sshd` running on the default port (22) exposed by the container
* The `vagrant` user's `authorized_keys` file must contain the Vagrant SSH insecure public key
  *  This is necessary for `vagrant ssh` to work
* The `vagrant` user configured to `sudo` all the things

## Ansible testing requirements

* Must be capable of running the appropriate systemd for the OS
* `root` user 's `authorized_keys` file must contain the Vagrant SSH insecure public key
  * This is necessary for ansible to operate in the default configuration (as `root`)
