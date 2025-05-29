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
Cada vez que se construye el contenedor se ejecuta `composer create-project` para 
generar en dicha carpeta el directorio `demo`, sobrescribiendo cualquier contenido
preexistente. Cualquier cambio dentro de `symfony` se refleja de inmediato en el
contenedor.



