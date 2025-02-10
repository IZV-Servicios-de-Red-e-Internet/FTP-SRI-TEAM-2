# 🚀 Proyecto de Servidores FTP y DNS con Ansible y Vagrant

Este proyecto tiene como objetivo la configuración, pruebas y documentación de servidores **DNS** y **FTP** utilizando **Ansible**, **Vagrant** y **scripts Bash**.

---

## 📂 Estructura del Proyecto

### 📁 Carpetas

- **[📂 /dns](/dns/README.md)** → Configuración del servidor DNS, incluyendo ajustes y correcciones recientes.
- **[📂 /ftp](ftp/)** → Configuración del servidor FTP, asegurando su correcta implementación y seguridad.
- **[📂 /playbooks](/playbooks)** → Playbooks de Ansible para la configuración y gestión de los servidores FTP y DNS.
- **[📂 /pruebas_comandos_FTP](/pruebas_comandos_FTP/)** → Pruebas de comandos del servidor FTP.
- **[📂 /tests](/tests/)** → Archivos para pruebas y validaciones, principalmente del servidor DNS.

### 📜 Archivos

- **📄 .gitignore** → Ignora archivos y carpetas específicas en el repositorio Git.
- **📄 [Vagrantfile](Vagrantfile)** → Configuración de entornos virtualizados con Vagrant.
- **📄 ansible.cfg** → Archivo de configuración para Ansible.
- **📄 hosts** → Inventario de Ansible con los hosts a configurar.
- **📄 main.yml** → Playbook principal de Ansible para la configuración de servidores.
- **📄 LICENSE** → Este proyecto está licenciado bajo la **MIT License**.

---

## 🖥️ Configuración de las Máquinas Virtuales

El `Vagrantfile` define **cuatro máquinas virtuales** basadas en **Debian Bookworm (64 bits)**, configuradas con redes privadas y, opcionalmente, redes públicas. Se asignan recursos mínimos para optimizar el rendimiento.

🔹 **Parámetros configurables:**
- **Nombre** → Identificación y hostname de la máquina.
- **Dirección IP** → Asignación de IP privada a cada máquina.
- **Puerto SSH** → Redirección de puerto SSH en el host.
- **Red Pública (Opcional)** → Conexión a la red pública a través de un puente.
- **Memoria RAM** → 512 MB por defecto.
- **CPU** → 1 vCPU por defecto.
- **Configuraciones adicionales** → Desactivación de NAT DNS resolver y proxy.

Configuración Vagrant `Vagrantfile`:
```ruby
# Función para crear máquinas virtuales
 def create_client(config, name, ip, host_port, public = nil)
  config.vm.box = "debian/bookworm64"
  config.vm.define name do |client|
    client.vm.network :private_network, ip: ip
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
  create_client(config, "mercurio.sistema.sol", "192.168.56.101", 2201, "public")
  create_client(config, "venus.sistema.sol", "192.168.56.102", 2202)
  create_client(config, "tierra.sistema.sol", "192.168.56.103", 2203)
  create_client(config, "marte.sistema.sol", "192.168.56.104", 2204)
end
```

Ejemplo de configuración en el archivo `hosts`:
```ini
[mercurio]
mercurio.sistema.sol ansible_ssh_host=127.0.0.1 ansible_ssh_port=2201

[venus]
venus.sistema.sol ansible_ssh_host=127.0.0.1 ansible_ssh_port=2202

[tierra]
tierra.sistema.sol ansible_ssh_host=127.0.0.1 ansible_ssh_port=2203

[marte]
marte.sistema.sol ansible_ssh_host=127.0.0.1 ansible_ssh_port=2204

[clients:children]
mercurio
venus
marte
```

---

## ⚙️ Instalación y Configuración

1️⃣ **Preparación del Entorno** -> Descarga el repositorio.
```bash
git clone https://github.com/IZV-Servicios-de-Red-e-Internet/FTP-SRI-TEAM-2.git
```
2️⃣ **Instala los paquetes vagrant y ansible** -> Si utilizas una distribución basada en Debian:
```bash
sudo apt update && sudo apt install vagrant ansible -y
```
3️⃣ **Entra en el directorio de la descarga**
```bash
cd FTP-SRI-TEAM-2
```
4️⃣ **Ejecución de `Vagrantfile`.**
```bash
vagrant up
```
5️⃣ **Ejecución del playbook principal `main.yml`.**
```bash
ansible-playbook main.yml
```
**Pruebas** -> Entra en venus.sistema.sol**
```bash
vagrant ssh venus.sistema.sol
```
**Instala el paquete lftp**
```bash
sudo apt update && sudo apt install lftp -y
```
**Cambia los  ajustes de lftp para que funcione con certificados autofirmados**
```bash
echo "set ssl:verify-certificate no" >> ~/.lftprc
```
**Crea un archivo para probar la subida**
```bash
touch file.txt
```
**Conectate al servidor ftp usando las credenciales de maria**
```bash
lftp -u maria mercurio.sistema.sol
```
**Usa la contraseña de maria**
```bash
password: usuario
```
**Sube un archivo usando**
```bash
put file.txt
```
---

## 🔧 Ejecución del Playbook Principal

El archivo `main.yml` incluye la configuración principal:
```yaml
---
- name: Configure web server
  hosts: all
  become: true
- name: FTP server provisioning
  ansible.builtin.import_playbook: playbooks/ftp_config.yml
- name: DNS server provisioning
  ansible.builtin.import_playbook: playbooks/dns_config.yml
- name: DNS server provisioning
  ansible.builtin.import_playbook: playbooks/clients_dns_config.yml

```

---

## 📌 Notas

⚡ **Ansible** está configurado con los siguientes parámetros en `ansible.cfg`:
```ini
[defaults]
inventory = hosts
remote_user = vagrant
private_key_file = ~/.vagrant.d/insecure_private_key
host_key_checking = false
```

📡 **Para más información sobre cada componente, revisa los archivos README dentro de las carpetas correspondientes.** 🚀

