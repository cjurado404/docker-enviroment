# Changelog

## [Unreleased]

- Add CI workflow to validate Docker Compose and shell scripts.
- Add Docker Compose environment with Apache PHP and MariaDB services.
- Add Dockerfile and entrypoint for Symfony installation.
- Add `symfony` directory placeholder.
- Add README with usage instructions.
- Update installation of Symfony skeleton to version `6.4.*`.
- Mount host `symfony` folder to `/var/www/html` so the `demo` directory syncs automatically.
- Create the project only when the `symfony` folder is empty.
- Improve entrypoint to skip `composer create-project` when any subdirectory exists.
- Run `composer create-project` unconditionally at container build time.


