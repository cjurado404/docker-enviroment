# docker-enviroment

Entorno de contenedores Docker que incluye:

- Apache con PHP en su versión más reciente.
- MariaDB como base de datos.
- Instalación automática de Symfony. Puede indicarse la versión mediante la variable `SYMFONY_VERSION`; si no se especifica se usa la `6.4`.

## Variables disponibles

- `SYMFONY_VERSION`: Versión de Symfony a instalar. Por defecto `6.4`.
- `PROJECT`: Nombre del proyecto Symfony y de la base de datos (`${PROJECT}_db`). Por defecto `my_project`.

## Uso

1. Construye las imágenes y levanta los contenedores:

```bash
docker compose up -d --build
```

Puedes definir la versión de Symfony al construir con la variable de entorno `SYMFONY_VERSION`:

```bash
PROJECT=blog SYMFONY_VERSION=5.4 docker compose up -d --build
```

2. Accede a la aplicación en [http://localhost](http://localhost).

El código del proyecto se sincroniza con la carpeta `./${PROJECT}` de tu máquina, de modo que los cambios se aplican al instante.

Los datos de MariaDB se almacenan en el volumen `db-data`.
