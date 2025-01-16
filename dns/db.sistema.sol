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
ftp		IN	CNAME	tierra			
