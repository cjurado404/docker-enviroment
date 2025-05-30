# docker-enviroment

Entorno de contenedores Docker que incluye:

- Apache con PHP 8.3 y Xdebug habilitado.
- MariaDB como base de datos.
- Composer, Symfony CLI y PHPUnit preinstalados.
- Instalación automática de Symfony 6.4 en el proyecto `demo` cuando aún no existe.


## Uso

1. Construye las imágenes y levanta los contenedores:

```bash
docker compose up -d --build
```

2. Accede a la aplicación en [http://localhost](http://localhost).

Los datos de MariaDB se almacenan en el volumen `db-data`.

El código del proyecto Symfony se sincroniza con la carpeta `./symfony` del host,
montada en `/var/www/html/demo` dentro del contenedor.
Al iniciar por primera vez se crea automáticamente el proyecto si no existe;
en arranques posteriores se reutilizan los archivos ya presentes. Cualquier
cambio dentro de `symfony` se refleja de inmediato en el contenedor.

