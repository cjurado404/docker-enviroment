# docker-enviroment

Entorno de contenedores Docker que incluye:

- Apache con PHP en su versión más reciente.
- MariaDB como base de datos.
- Instalación automática de Symfony. Puede indicarse la versión mediante la variable `SYMFONY_VERSION`; si no se especifica se usa la 6.4.

- El nombre del proyecto Symfony puede definirse con la variable `PROJECT`; por defecto es `my_project`. La base de datos se llamará `${PROJECT}_db`.


## Uso

1. Construye las imágenes y levanta los contenedores:

```bash
docker compose up -d --build
```

Puedes definir la versión de Symfony al construir con la variable de entorno `SYMFONY_VERSION` y el nombre del proyecto con `PROJECT`:

```bash
SYMFONY_VERSION=5.4 PROJECT=demo docker compose up -d --build
=======
Puedes definir la versión de Symfony y el nombre del proyecto al construir con las variables de entorno `SYMFONY_VERSION` y `PROJECT`:

```bash
SYMFONY_VERSION=5.4 PROJECT=blog docker compose up -d --build

```

2. Accede a la aplicación en [http://localhost](http://localhost).

Los datos de MariaDB se almacenan en el volumen `db-data`.

El código del proyecto Symfony se sincroniza con la carpeta `./symfony` del host,
por lo que cualquier cambio en esa carpeta se refleja de inmediato en el conten
edor.

## Variables disponibles

- `SYMFONY_VERSION`: versión de Symfony a instalar (por defecto `6.4`).
- `PROJECT`: nombre del proyecto Symfony y de la base de datos (por defecto `my_project`).
=======

