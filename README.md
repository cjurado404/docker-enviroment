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

Puedes definir la versión de Symfony y el nombre del proyecto al construir con las variables de entorno `SYMFONY_VERSION` y `PROJECT`:

```bash
SYMFONY_VERSION=5.4 PROJECT=blog docker compose up -d --build
```

2. Accede a la aplicación en [http://localhost](http://localhost).

Los datos de MariaDB se almacenan en el volumen `db-data`.
