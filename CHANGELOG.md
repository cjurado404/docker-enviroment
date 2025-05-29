# Changelog

## [Unreleased]

- Add CI workflow to validate Docker Compose and shell scripts.
- Add Docker Compose environment with Apache PHP and MariaDB services.
- Add Dockerfile and entrypoint for Symfony installation.
- Add `symfony` directory placeholder.
- Add README with usage instructions.
- Update installation of Symfony skeleton to version `6.4.*`.
- Mount host `symfony` folder to `/var/www/html/demo` para sincronizar el proyecto.
- Crear el proyecto solo cuando `composer.json` no exista en la carpeta.
- Simplificar el entrypoint para ejecutar `composer create-project` solo en ese caso.
- Instalar Xdebug, Symfony CLI, Composer y PHPUnit en la imagen.
- Eliminar la carpeta `symfony` de ejemplo y añadir un `.gitignore` general.


