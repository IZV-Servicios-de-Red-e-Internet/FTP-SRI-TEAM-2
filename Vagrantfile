#Function 
def create_client(config, name, ip, host_port, public = nil)
  config.vm.box = "debian/bookworm64"
  config.vm.define name do |client|
    client.vm.network :private_network,
      ip: ip
    client.vm.hostname = name
    client.vm.network "forwarded_port", guest: 22, host: host_port, id: 'ssh'
    if public
      config.vm.network "public_network", bridge: "enp61s0"
    end
    config.ssh.insert_key = false
  end
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "512"
    vb.cpus = 1
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
  end
end

Vagrant.configure("2") do |config|
  create_client(config, "mercurio.sistema.sol", "192.168.56.101",2201,"public")
  create_client(config, "venus.sistema.sol", "192.168.56.102",2202)
  create_client(config, "tierra.sistema.sol", "192.168.56.103",2203)
  create_client(config, "marte.sistema.sol", "192.168.56.104",2204)
end
