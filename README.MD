# Proyecto de Servidores FTP y DNS con Ansible y Vagrant

Este proyecto tiene como objetivo la configuración, pruebas y documentación de servidores DNS y FTP utilizando herramientas como Ansible y Vagrant.

## Contenido del Proyecto

### Carpetas

- **[/dns](/dns/README.md)**: Contiene configuraciones relacionadas con el servidor DNS, incluyendo ajustes y correcciones recientes.


- **[/ftp](ftp/)**: Incluye configuraciones para el servidor FTP, asegurando su correcta implementación y seguridad.
  
- **[/playbooks](/playbooks)**: Contiene los playbooks de Ansible que configuran y manejan los servidores FTP y DNS.

- **[/pruebas_comandos_FTP](/pruebas_comandos_FTP/)**: Carpeta con pruebas de comandos relacionados con el servidor FTP.

- **[/tests](/tests/)**: Archivos para pruebas y validaciones, principalmente del servidor DNS.

### Archivos

- **.gitignore**: Configuración para ignorar archivos y carpetas específicos en el repositorio Git.

- **[Vagrantfile](Vagrantfile)**: Archivo para la configuración de entornos virtualizados con Vagrant.

- **ansible.cfg**: Archivo de configuración para Ansible.
```

[defaults]
#Archivo de VMs
inventory = hosts
#Usuario por defecto
remote_user = vagrant
#Ruta del archivo de claves ssh
private_key_file = ~/.vagrant.d/insecure_private_key
#Para evitar error de clave insegura
host_key_checking = false

```

- **hosts**: Archivo de inventario de Ansible, que especifica los hosts que serán configurados.
```
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


- **main.yml**: Playbook principal para Ansible, con tareas relacionadas con la configuración de servidores DNS y FTP.
```
---
- name: Configure web server
  hosts: all
  become: true
#- import_playbook: playbooks/test.yml
- import_playbook: playbooks/ftp_config.yml
- import_playbook: playbooks/dns_config.yml
- import_playbook: playbooks/clients_dns_config.yml



```


---

## Instalación y Configuración

1. **Preparación del Entorno**: Se utiliza Vagrant para configurar máquinas virtuales y Ansible para la automatización de tareas.
2. **Configuración de DNS**: Los archivos y carpetas en **[/dns](/dns/README.md)** contienen la configuración necesaria.
3. **Configuración de FTP**: Los archivos y carpetas en  **[/ftp](ftp/)** incluyen configuraciones específicas para el servidor FTP.
4. **Pruebas**: Las pruebas se encuentran en **[/tests](/tests/)** y **[/pruebas_comandos_FTP](/pruebas_comandos_FTP/)**.
