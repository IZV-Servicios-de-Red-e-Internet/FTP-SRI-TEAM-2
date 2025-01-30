# Proyecto de Servidores FTP y DNS con Ansible y Vagrant

Este proyecto tiene como objetivo la configuración, pruebas y documentación de servidores DNS y FTP utilizando herramientas como Ansible y Vagrant.

## Contenido del Proyecto

### Carpetas

- **/dns**: Contiene configuraciones relacionadas con el servidor DNS, incluyendo ajustes y correcciones recientes.


- **/ftp**: Incluye configuraciones para el servidor FTP, asegurando su correcta implementación y seguridad.
  
- **/playbooks**: Contiene los playbooks de Ansible que configuran y manejan los servidores FTP y DNS.

- **/pruebas_comandos_FTP**: Carpeta con pruebas de comandos relacionados con el servidor FTP.

- **/tests**: Archivos para pruebas y validaciones, principalmente del servidor DNS.

### Archivos

- **.gitignore**: Configuración para ignorar archivos y carpetas específicos en el repositorio Git.

- **Vagrantfile**: Archivo para la configuración de entornos virtualizados con Vagrant.

- **ansible.cfg**: Archivo de configuración para Ansible.

- **hosts**: Archivo de inventario de Ansible, que especifica los hosts que serán configurados.

- **main.yml**: Playbook principal para Ansible, con tareas relacionadas con la configuración de servidores DNS y FTP.

---

## Instalación y Configuración

1. **Preparación del Entorno**: Se utiliza Vagrant para configurar máquinas virtuales y Ansible para la automatización de tareas.
2. **Configuración de DNS**: Los archivos y carpetas en `/dns` contienen la configuración necesaria.
3. **Configuración de FTP**: Los archivos y carpetas en `/ftp/` incluyen configuraciones específicas para el servidor FTP.
4. **Pruebas**: Las pruebas se encuentran en `/tests` y `pruebas_comandos_FTP/`.
