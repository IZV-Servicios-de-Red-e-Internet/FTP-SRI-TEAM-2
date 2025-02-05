# 📘 Playbooks para Configuración de Clientes y Servicios

Este repositorio contiene los playbooks de Ansible diseñados para configurar servicios en distintos hosts de manera automatizada.
Se ejecutan a través del uso de main.yml en el directorio root.

---

## 📌 Playbooks Disponibles

### 🖥️ `clients_dns_config.yml`
Configura las opciones de DNS en un grupo de hosts clientes.

#### ▶️ Uso
Ejecuta el siguiente comando desde tu controlador de Ansible:
```bash
ansible-playbook -i inventory.ini clients_dns_config.yml
```

---

### 🌍 `dns_config.yml`
Instala y configura un servidor DNS en el host `tierra`.

#### ▶️ Uso
```bash
ansible-playbook -i inventory.ini dns_config.yml
```

#### 🛠️ Tareas realizadas
✅ Instalación de paquetes necesarios para el DNS.
✅ Configuración del servidor DNS.
✅ Creación de archivos de zona para `example.com`.
✅ Configuración de cuentas de usuario con permisos adecuados.
✅ Establecimiento de propiedad de archivos y permisos de seguridad.

#### 🔄 Handlers utilizados
📌 `Reiniciar y habilitar bind9` → Se encarga de reiniciar y habilitar `bind9` después de la configuración.

---

### 📂 `ftp_config.yml`
Instala y configura un servidor FTP en el host `mercurio`.

#### ▶️ Uso
```bash
ansible-playbook -i inventory.ini ftp_config.yml
```

#### 🛠️ Tareas realizadas
✅ Instalación de `vsftpd` y `ftp`.
✅ Copia de la configuración original de `vsftpd`.
✅ Configuración de un mapping FTP (`ftp.sistema.sol`).
✅ Copia de archivos de configuración y usuarios con caja de seguridad.
✅ Creación de cuentas de usuario: `luis`, `miguel` y `maria`.
✅ Generación de archivos de prueba en los directorios de cada usuario.

#### 🔄 Handlers utilizados
📌 `Comenzar y habilitar vsftpd` → Se encarga de iniciar y habilitar el servicio `vsftpd` después de la configuración.

---
