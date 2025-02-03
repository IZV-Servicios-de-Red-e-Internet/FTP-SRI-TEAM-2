# 🚀 Proyecto FTP: Uso del Cliente FTP en Línea de Comandos

Este documento detalla los pasos para conectarse y operar con un servidor FTP desde la línea de comandos.

---

## 📌 Pasos a Seguir

### 1️⃣ Inicia sesión en la máquina `tierra` con la cuenta `pepe`
Si la cuenta no existe, créala con el siguiente comando:

```bash
sudo adduser pepe
```

![Paso1](./imagen1.png)
![Paso2](./imagen1-2.png)

---

### 2️⃣ Crea el directorio `/home/pepe/pruebasFTP` y accede a él

```bash
mkdir -p /home/pepe/pruebasFTP
cd /home/pepe/pruebasFTP
```

![Paso3](./imagen2.png)

---

### 3️⃣ Crea el archivo `datos1.txt` dentro del directorio `pruebasFTP`

```bash
echo "Este es el contenido de datos1.txt" > datos1.txt
```

![Paso4](./imagen3.png)
![Paso5](./imagen3-2.png)

---

### 4️⃣ Conéctate al servidor FTP `ftp.cica.es` usando `pftp`

```bash
pftp ftp.cica.es
```

Cuando se soliciten credenciales:
- **Usuario:** `anonymous`
- **Contraseña:** Tu dirección de correo electrónico o simplemente presiona `Enter`.

![Paso6](./imagen4.png)

---

### 5️⃣ Verifica el directorio actual en el servidor

```bash
pwd
```

![Paso7](./imagen5.png)

---

### 6️⃣ Verifica el directorio actual en el cliente

```bash
lpwd
```

![Paso8](./imagen6.png)

---

### 7️⃣ Lista los archivos en el servidor

```bash
ls
```

![Paso9](./imagen7.png)

---

### 8️⃣ Lista los archivos en el cliente

```bash
!ls
```
*(En Windows, usa `!dir` en lugar de `!ls`.)*

![Paso10](./imagen8.png)

---

### 9️⃣ Descarga el archivo `/pub/check` del servidor

```bash
get /pub/check
```

![Paso11](./imagen9.png)

---

### 🔟 Verifica la descarga del archivo

```bash
!ls
```

![Paso12](./imagen10.png)

---

### 1️⃣1️⃣ Crea el directorio `imágenes` dentro de `pruebasFTP` en el servidor

```bash
mkdir pruebasFTP/imágenes
```

Verifica la creación con:

```bash
ls pruebasFTP
```

![Paso13](./imagen11.png)

---

### 1️⃣2️⃣ Sube el archivo `datos1.txt` al servidor

```bash
put datos1.txt pruebasFTP/datos1.txt
```

Si aparece un error `550 Permission denied`, significa que no tienes permisos de escritura en el servidor.

![Paso14](./imagen12.png)

---

### 1️⃣3️⃣ Cierra la conexión con el servidor

Para salir de la sesión FTP de manera segura, usa:

```bash
bye
```

O alternativamente:

```bash
quit
```

![Paso15](./imagen13.png)

---

## 📜 Licencia
Este proyecto está licenciado bajo la **MIT License**. Consulta el archivo [LICENSE](LICENSE) para más información.

