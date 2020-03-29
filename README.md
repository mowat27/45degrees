# 45 Degrees 

I am a member of a [Mountaineering Club](https://45degreesmc.wordpress.com/) and recently (March 2020) I took over the ownership of the club website.  At the moment it is just a basic [wordpress.com](https://wordpress.com) site and it needs a bit of work.

I'm not very familiar with Wordpress and I decided to create a local development environment so I have a place to experiment and learn about how it works under the covers.

## Quick Start 

Install:

* Docker
* Docker Compose
* xcode developer tools 

Run `make` to start the app

This creates an empty Wordpress blog using the [wordpress](https://hub.docker.com/_/wordpress) and [mysql](https://hub.docker.com/_/mysql) images from [docker hub](https://hub.docker.com/) and opens `/wp-admin` in your default browser.  You will be prompted for config values unless you have a `.env` file in the root directory of this repo.

The [Wordpress Importer](https://en-gb.wordpress.org/plugins/wordpress-importer/) plugin is also installed and activated so you can import [WordPress eXtended Rss (WXR)](https://devtidbits.com/2011/03/16/the-wordpress-extended-rss-wxr-exportimport-xml-document-format-decoded-and-explained/) files from other Wordpress sites.

Run `make down` to stop the app and remove all running containers.  Your data (Wordpress filesystem and MySQL database) will be preserved in docker volumes.

## Configuration

The following variables must be set in a Docker Compose [`.env` file](https://docs.docker.com/compose/env-file/) that is ignored by git.

| Variable | Description | Default |
| -------- | ----------- | ------- |
| APP_NAME | Name of the app | |
| HOST_PORT | Expose the app on this localhost port | |
| WORDPRESS_DB_HOST | Name of the mysql container in `docker-compose.yml` | `db` |
| WORDPRESS_DB_NAME | MySql database name | `wp_${APP_NAME}` |
| WORDPRESS_DB_USER | MySql user | `DB_USER` |
| WORDPRESS_DB_PASSWORD | MySql password | `DB_PASSWORD` |
| MYSQL_DATABASE | MySql database name | `wp_${APP_NAME}` |
| MYSQL_USER | MySql user | `DB_USER` |
| MYSQL_PASSWORD | MySql password | `DB_PASSWORD` |
| MYSQL_ROOT_PASSWORD | MySql root password | `DB_PASSWORD` |
| WP_ADMIN_USER | Wordpress admin user name | |
| WP_ADMIN_PASSWORD | Wordpress admin user password ||

Run `make .env` to generate a working `.env` file setting some defaults as shown in the table above.

## Make Targets

The following targets are useful when working with the app. See the [Makefile](/blob/master/Makefile) for more details.

| Target | Description |
| ------ | ----------- |
| `start` | Start docker compose in the background |
| `up` | Start docker compose in the foreground |
| `clean-start` | Destroy everything (including volumes) and start in the background |
| `down` | Stop and remove running containers.  Data is preserved in docker volumes |
| `prune` | Delete docker volumes |
| `init` | Initialize Wordpress with values from `.env` |
| `bash` | Start a shell on the Wordpress container |
| `web`  | Open the blog in your browser |
| `wp-admin` | Open /wp-admin in your browser |

## Distribution

Distributed under the [MIT License](/blob/master/LICENSE) You are welcome to copy and modify it if you find it helpful.

Please note it this code is MacOS only and **not fit for production**.


