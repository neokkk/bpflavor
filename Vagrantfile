# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

$bootstrap=<<SCRIPT
apt install make glibc-devel.i686 elfutils-libelf-devel wget tar vim tmux jq systemtap-sdt-devel clang bcc strace kernel-devel-5.0.9-301.fc30 -y
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	ipv4 = "192.168.33.10"
	config.vm.define "bpfbook" do |ubuntu|
	ubuntu.vm.box = "ubuntu/jammy64"
		net_index = 1
		ubuntu.vm.hostname = "bpfbook"
		ubuntu.vm.provider "virtualbox" do |vb|
			vb.customize ["modifyvm", :id, "--memory", "1024"]
		end
		ubuntu.vm.provider "libvirt" do |lv|
			lv.memory = 1024
		end
		ubuntu.vm.network :private_network, ip: "#{ipv4}"
		ubuntu.vm.provision :shell, inline: $bootstrap, :args => "#{ipv4}"
	end
end
