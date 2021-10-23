# Gatsby + WordPress, Docker Trial
Creates a local instance of Gatsby, WordPress and MariaDB.

To start, run `gatsby new` to create a Gatsby site called `gatsby`.

```
gatsby new gatsby https://github.com/gatsbyjs/gatsby-starter-wordpress-blog
```

Now run the `docker-compose up` command to setup the site duo.

Gatsby + WP installation guide: https://github.com/gatsbyjs/gatsby-source-wordpress-experimental/blob/master/docs/getting-started.md

Also, add the following to your wp-config.php post-install (around the 'Happy publishing' mark), otherwise wp-admin will fight you with redirects.

```
$_SERVER['REQUEST_URI'] = '/wp' . $_SERVER['REQUEST_URI'];
```

## Sites
* Gatsby runs on http://localhost.
* WordPress runs on http://localhost/wp.
* phpMyAdmin accessible via http://localhost/pma.
