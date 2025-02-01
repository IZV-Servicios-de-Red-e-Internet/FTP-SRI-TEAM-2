# Playbooks para configuración de clientes y servicios
=====================================

## clients_dns_config.yml
Una simple tarea de Ansible para configurar las configuraciones de DNS para un grupo de hosts.

### Uso

Cargar en tu controlador de Ansible y ejecutarla contra el grupo de hosts "clientes":

```bash
ansible-playbook -i inventory.ini 
```

## dns_config.yml

Una simple tarea de Ansible para insertar archivos y configurar las configuraciones de DNS para un host con el 
nombre "tierra".

### Uso

Cargar en tu controlador de Ansible y ejecutarla contra el host "tierra":

```bash
ansible-playbook -i inventory.ini dns_config.yml
```

### Tareas

La tarea realiza las siguientes tareas:

1. Instala los paquetes necesarios para la configuración de DNS.
2. Configura el servidor de DNS para su uso.
3. Establece archivos de zona para example.com.
4. Crea cuentas de usuario con permisos adecuados.
5. Establece propiedad de archivo y permisos para una seguridad óptima.

### Descripción del playbook

Este playbook se diseña para instalar y configurar bind9, un software de servidor DNS, en el host "tierra".

### Handlers

La tarea utiliza un manejador personalizado llamado "Reiniciar y habilitar bind9" para reiniciar y habilitar 
la servicio bind9 después de completar todas las tareas.

## ftp_config.yml
Una simple tarea de Ansible para configurar y seguridad un servidor FTP en el host "mercurio".

### Uso

Cargar en tu controlador de Ansible y ejecutarla contra el host "mercurio":

```bash
ansible-playbook -i inventory.ini ftp_config.yml
```

### Descripción del playbook

Este playbook se diseña para instalar y configurar vsftpd, un software de servidor FTP, en el host "mercurio".

### Tareas

La tarea realiza las siguientes tareas:

1. Instala vsftpd y ftp.
2. Copia la configuración original del archivo vsftpd.
3. Agrega una mapping FTP para que mercurio pueda encontrarlo como ftp.sistema.sol.
4. Copia archivos de configuración para vsftpd y usuarios con caja de seguridad.
5. Crea tres cuentas de usuario: luis, miguel y maria.
6. Crea dos archivos de prueba en cada directorio de casa del usuario.

### Handlers

La tarea utiliza un manejador personalizado llamado "Comenzar y habilitar vsftpd" para comenzar y habilitar el 
servicio vsftpd después de completar todas las tareas.
