# Gatsby + WordPress, Docker Trial
Creates a local instance of Gatsby, WordPress and MariaDB.

To start, run `gatsby new` to create a Gatsby site called `gatsby`.

```
gatsby new gatsby https://github.com/gatsbyjs/gatsby-starter-wordpress-blog

```

Now run the `docker-compose up` command to setup the site duo.

Gatsby + WP installation guide: https://github.com/gatsbyjs/gatsby-source-wordpress-experimental/blob/master/docs/getting-started.md

## Localhost Sites

Site       | Port | URL 
-----------|------|-----
WordPress  | 8080 | http://localhost:8080/wp-admin/
Gatsby     | 8081 | http://localhost:8081/
phpMyAdmin | 8082 | http://localhost:8082/