# Vagrant capable Docker Images

## Overview

The project defines a set of Docker images which are configured to run as 
[Vagrant](https://vagrantup.com) "VM"s via the 
[Docker provider](https://developer.hashicorp.com/vagrant/docs/providers/docker).
The configuration in fact goes a bit beyond what is required to run in Vagrant as 
my intention is to use these images as the basis of setting up sandbox linux clusters 
for testing [Ansible](https://docs.ansible.com/) based configuration management collections.

## Motivation

Part of what I do at work is develop and maintain Ansible roles and playbooks for various applications that we manage.
Using local VMs is a good way to keep the inner development loop running smoothly for these projects.
Vagrant is a very convenient way to manage networks of local VMs.

I've recently started using an M1 (arm64) macbook at work.  
Vagrant has very limited support for arm64 architectures.
VirtualBox which is the default VM provider for Vagrant only recently added _alpha_ level support for arm64 and as of this writing there are no pre-built Vagrant "boxes" available for this architecture.
Docker on the other hand runs just fine on arm64 and Vagrant has a perfectly serviceable docker provider.
The only catch is you have to bring your own images.
Thus this project.

## Pros and Cons

There are advangages and disadvantages to using container images to simulate virtual machines.

The Good:

* very fast - can start a cluster of 7 "virtual machines" in less than 20 seconds
* runs just dandy on Apple M1 macbooks

The Bad:

* no access to low level OS constructs: for example can't test anything that involves `iptables` (think kubernetes CNI plugins)

## Supported container images

* CentoOS 7
* Rocky Linux 9
* Ubuntu 22.04

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
