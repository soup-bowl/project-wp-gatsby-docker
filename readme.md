# Gatsby + WordPress, Docker Trial
Creates a local instance of Gatsby, WordPress and MariaDB.

To start, run `gatsby new` to create a Gatsby site called `gatsby` in the www folder.

```bash
( cd www && gatsby new gatsby https://github.com/gatsbyjs/gatsby-starter-wordpress-blog )
```

Now run the `docker-compose up` command to setup the site duo.

Gatsby + WP installation guide: https://github.com/gatsbyjs/gatsby-source-wordpress-experimental/blob/master/docs/getting-started.md

Also, add the following to your wp-config.php (around the 'Happy publishing' mark), otherwise wp-admin will fight you with redirects.

```php
if ( str_contains( $_SERVER['REQUEST_URI'], 'wp-admin' ) ) { $_SERVER['REQUEST_URI'] = '/wp' . $_SERVER['REQUEST_URI']; }
if ( str_contains( $_SERVER['REQUEST_URI'], 'graphql' ) ) { $_SERVER['REQUEST_URI'] = '/wp' . $_SERVER['REQUEST_URI']; }
```

And if you try to change permalink structure you will need to rebuild the WordPress instance. God knows why, I've tried both proxy-pass WordPress Apache & FPM WordPress and both have been an absolute nightmare to configure. Anyone with more time to dedicate to learning these specifics please feel free to fork or PR, but I don't have the time to waste away on this nightmare. It's 2021 - it shouldn't be this god-damn difficult to setup proxy routing.

## Sites
* Gatsby runs on http://localhost.
* WordPress runs on http://localhost/wp.
* phpMyAdmin accessible via http://localhost/pma.
