#Function 
def create_client(config, name, ip)
  config.vm.define name do |client|
    client.vm.network :private_network,
      ip: ip
    client.vm.hostname = name
  end
end

Vagrant.configure("2") do |config|
  config.vm.box = "debian/bookworm64"
  create_client(config, "mercurio.sistema.sol", "192.168.56.101")
  create_client(config, "venus.sistema.sol", "192.168.56.102")
  create_client(config, "tierra.sistema.sol", "192.168.56.103")
  create_client(config, "marte.sistema.sol", "192.168.56.104")
end
