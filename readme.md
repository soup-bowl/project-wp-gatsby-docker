# Gatsby + WordPress, Docker Experiment
Creates a local instance of Gatsby, WordPress and MariaDB. **This is an in-progress experiment, there will be problems**.

## Getting Started
Set `proxy` to `127.0.0.1` in your hosts file. This is to give both your host system and the internal container a unified URL reference, otherwise WordPress will constantly throw it's toys out of the pram during configuration.

At first run, ensure the `www` directory in this folder is empty. Run the `docker-compose up --build -d` command to setup the site duo.

Gatsby will build in the `www/gatsby` directory with the WordPress variant. Similarly, `www/wordpress` will contain the WordPress installation.

Also, add the following to your wp-config.php (around the 'Happy publishing' mark), otherwise wp-admin will fight you with redirects.

```php
if ( str_contains( $_SERVER['REQUEST_URI'], 'wp-admin' ) ) { $_SERVER['REQUEST_URI'] = '/wp' . $_SERVER['REQUEST_URI']; }
if ( str_contains( $_SERVER['REQUEST_URI'], 'graphql' ) ) { $_SERVER['REQUEST_URI'] = '/wp' . $_SERVER['REQUEST_URI']; }
```

Run through the wp installer. It's buggy - It'll redirect you to the wrong URL, but go back to http://proxy/wp/wp-admin/installer.php. Once done (you can complete regardless of the broken styling) login to http://proxy/pma, head into wordpress/wp_options, and change both `siteurl` and `home` to add the missing `/wp` bit. 

Warning: If you try to change permalink structure you will need to rebuild the WordPress instance. God knows why, I've tried both proxy-pass WordPress Apache & FPM WordPress and both have been an absolute nightmare to configure. Anyone with more time to dedicate to learning these specifics please feel free to fork or PR, but I don't have the time to waste away on this nightmare. It's 2021 - it shouldn't be this god-damn difficult to setup proxy routing.

Gatsby + WP installation guide: https://github.com/gatsbyjs/gatsby-source-wordpress-experimental/blob/master/docs/getting-started.md

Install the following plugins on your WordPress instance:
- GraphQL - https://wordpress.org/plugins/wp-graphql/
- GatsbyWP - https://wordpress.org/plugins/wp-gatsby/

Once you're happy, set the `gatsby-config.js` to point to http://proxy/wp/graphql and run `gatsby build` on the www/gatsby directory. Run `docker-compose up -d` to check if the Gatsby container is off and restart it, and you should have a Gatsby site working with the content from the WP site.

To update the Gatsby site, restart the GatsbyJS container:
```bash
docker-compose restart gb
```

## Sites
* Gatsby runs on http://proxy.
* WordPress runs on http://proxy/wp.
* phpMyAdmin accessible via http://proxy/pma.
