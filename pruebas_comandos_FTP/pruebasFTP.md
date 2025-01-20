# Proyecto FTP: Uso del cliente FTP en línea de comandos

## Pasos a seguir

### 1. Inicia sesión en la máquina `tierra` con la cuenta `pepe`
Si la cuenta no existe, se debe crear. Entra en la máquina `tierra.sistema.sol` y crea el usuario `pepe`.

```bash
sudo adduser pepe
```

---

### 2. Crea el directorio `/home/pepe/pruebasFTP` y cámbiate a dicho directorio
```bash
mkdir -p /home/pepe/pruebasFTP
cd /home/pepe/pruebasFTP
```

---

### 3. Crea el archivo `datos1.txt` en el directorio `pruebasFTP`
Añade el contenido que quieras al archivo:

```bash
echo "Este es el contenido de datos1.txt" > datos1.txt
```

---

### 4. Establece una conexión anónima al servidor `ftp.cica.es` usando el cliente `pftp`
Desde la máquina `tierra`, inicia una conexión con el servidor:

```bash
pftp ftp.cica.es
```
Cuando se soliciten credenciales, utiliza las siguientes:
- **Usuario:** `anonymous`
- **Contraseña:** tu dirección de correo electrónico o presiona Enter.

---

### 5. Examina la ruta o directorio activo en el servidor
Dentro de la sesión FTP, ejecuta:

```bash
pwd
```
Esto mostrará el directorio activo en el servidor.

---

### 6. Examina la ruta o directorio activo en el cliente
Para ver el directorio local activo, usa:

```bash
lpwd
```

---

### 7. Haz un listado de los archivos del servidor
Lista los archivos en el directorio actual del servidor:

```bash
ls
```

---

### 8. Haz un listado de los archivos de la carpeta del cliente
Lista los archivos locales del directorio activo:

```bash
!ls
```
(En Windows, usa `!dir` en lugar de `!ls`.)

---

### 9. Descarga el archivo `/pub/check` del servidor
Para descargar un archivo específico del servidor al cliente, utiliza:

```bash
get /pub/check
```

---

### 10. Comprueba que se ha descargado el archivo
Lista los archivos en tu directorio local para verificar que el archivo se haya descargado correctamente:

```bash
!ls
```

---

### 11. Crea el directorio `imágenes` dentro de `pruebasFTP` en el servidor
Para crear un directorio en el servidor, usa:

```bash
mkdir pruebasFTP/imágenes
```
Luego, verifica que se haya creado correctamente:

```bash
ls pruebasFTP
```

---

### 12. Intenta subir el archivo `datos1.txt` al servidor
Sube el archivo al servidor con:

```bash
put datos1.txt pruebasFTP/datos1.txt
```
Si recibes un error como `550 Permission denied`, significa que no tienes permisos para subir archivos al servidor.

---

### 13. Cierra la conexión con el servidor
Para salir de la sesión FTP de manera segura, utiliza:

```bash
bye
```
O alternativamente:

```bash
quit
