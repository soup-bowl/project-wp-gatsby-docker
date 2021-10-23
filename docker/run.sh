#!/bin/bash
cd /app
if [ ! -f "/app/gatsby-node.js" ]; then
    gatsby new . https://github.com/gatsbyjs/gatsby-starter-wordpress-blog
fi
gatsby build
gatsby serve -H 0.0.0.0
