# docker-enviroment

Entorno de contenedores Docker que incluye:

- Apache con PHP en su versión más reciente.
- MariaDB como base de datos.
- Instalación automática de Symfony 6.4 en el proyecto `demo`.


## Uso

1. Construye las imágenes y levanta los contenedores:

```bash
docker compose up -d --build
```

2. Accede a la aplicación en [http://localhost](http://localhost).

Los datos de MariaDB se almacenan en el volumen `db-data`.

El código del proyecto Symfony se sincroniza con la carpeta `./symfony` del host.
Al iniciar por primera vez se crea en ella el directorio `demo`, que contiene el proyecto Symfony.
En posteriores arranques, el script de entrada comprueba si dentro de `symfony` existe
algún subdirectorio (por ejemplo `demo`, `blog`, `todo`). Si no encuentra ninguno,
ejecuta `composer create-project` para generar un nuevo proyecto; de lo contrario,
se reutilizan los archivos existentes. Cualquier cambio dentro de esa carpeta se
refleja de inmediato en el contenedor.



