
# Servidor DNS

## Introducción

En este documento vamos a comentar lo que podemos encontrar dentro de la carpeta DNS. Explicaremos en profundidad sus ficheros y su configuracion.

## Fichero db.56.168.192 

Archivo de configuracion inversa para el servidor DNS, el cual cuenta con las maquinas tierra, mercurio, venus y marte.

```
;
; BIND reverse data file for local loopback interface
;
$TTL	604800
@	IN	SOA	tierra.sistema.sol. root.tierra.sistema.sol. (
			      2		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	tierra.sistema.sol.
103	IN	PTR	tierra.sistema.sol.
101 IN 	PTR mercurio.sistema.sol.
102 IN 	PTR	venus.sistema.sol.
104 IN	PTR marte.sistema.sol.

```

## Fichero db.sistema.sol

Archivo de configuracion para la zona del servidor el cual aparte de contar con las maquinas de tierra, mercurio, venus y marte, cuenta tambien con un servicio FTP que se encuentra en la maquina mercurio.

```
;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	tierra.sistema.sol root.sistema.sol. (
			      2		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	tierra.sistema.sol.
tierra	IN	A	192.168.56.103
mercurio IN	A	192.168.56.101
venus	IN	A	192.168.56.102
marte	IN	A 	192.168.56.104
ftp		IN	CNAME	mercurio			


```
## Fichero named - named.conf.local - named.conf.options

El fichero named es el archivo de configuracion del servidor DNS, el cual contiene la configuracion de las zonas DNS y los servidores DNS.

- Vamos a ver que este fichero solo cuenta con una linea de configuracion.

```
#
# run resolvconf?
RESOLVCONF=no

# startup options for the server
OPTIONS="-u bind -4"

```

El fichero named.conf.local es el archivo de configuracion de la zona local del servidor DNS.

- Aqui encontramos decimos donde se encuentran los archivos de configuracionde las zonas DNS y que servidor es el Maestro

```
//
// Do any local configuration here
//

// Consider adding the 1918 zones here, if they are not used in your
// organization
//include "/etc/bind/zones.rfc1918";

zone "sistema.sol" {
  type master;
  file "/etc/bind/db.sistema.sol";
};

zone "56.168.192.in-addr.arpa" {
  type master;
  file "/var/lib/bind/db.56.168.192";
};

```
    
El fichero named.conf.options es el archivo de configuracion de las opciones del servidor DNS.
        
- Aqui encontramos la configuracion de la zona DNS, la configuracion de los servidores DNS y la configuracion de los archivos de configuracion de las zonas DNS.

```
acl trusted {
	127.0.0.0/8;
	192.168.56.0/24;
};
options {
	directory "/var/cache/bind";
	
	allow-query { trusted; };
	
	recursion yes;

	allow-recursion { trusted; };


	//========================================================================
	// If BIND logs error messages about the root key being expired,
	// you will need to update your keys.  See https://www.isc.org/bind-keys
	//========================================================================
	dnssec-validation yes;

	listen-on-v6 { none; };
};

```


---
***Author  dlopmal873@ieszaidinvergeles.org***