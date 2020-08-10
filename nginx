## Update and Install Packages

Let's keep this short.

```
sudo apt-get install nginx
```

## nginx.conf

```
user www-data;
worker_processes auto;
events {
    worker_connections 768;
    # multi_accept on;
}

http {

    ##
    # Basic Settings
    ##

    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout 65;
    types_hash_max_size 2048;
    server_tokens off;

    server_names_hash_bucket_size 64;
    # server_name_in_redirect off;

    include /etc/nginx/mime.types;
    default_type application/octet-stream;
    client_max_body_size 10M;

    ##
    # Logging Settings
    ##

    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log;
    
    ##
    # Gzip Settings
    ##

    gzip on;
    gzip_disable "msie6";

    gzip_vary on;
    gzip_proxied any;
    gzip_comp_level 6;
    gzip_buffers 16 8k;
    gzip_http_version 1.1;
    gzip_min_length 256;
    gzip_types text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript application/vnd.ms-fontobject application/x-font-ttf font/opentype image/svg+xml image/x-icon;

    ##
    # Virtual Host Configs
    ##

    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*;
}
```

## Create a Host

```
sudo vim /etc/nginx/sites-available/site.com
sudo ln -s /etc/nginx/sites-available/site.com /etc/nginx/sites-enabled/site.com
```

### Host Config (grav)

```
server {
    listen 80;
    listen [::]:80;

    root /var/www/site.com;
    index index.php index.html index.htm;

    server_name site.com www.site.com;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.2-fpm.sock;

        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root/$fastcgi_script_name;
    }

    ## Begin - Security
    location ~* /(\.git|cache|bin|logs|backup|tests)/.*$ { return 403; }
    location ~* /(system|vendor)/.*\.(txt|xml|md|html|yaml|yml|php|pl|py|cgi|twig|sh|bat)$ { return 403; }
    location ~* /user/.*\.(txt|md|yaml|yml|php|pl|py|cgi|twig|sh|bat)$ { return 403; }
    location ~ /(LICENSE\.txt|composer\.lock|composer\.json|nginx\.conf|web\.config|htaccess\.txt|\.htaccess) { return 403; }
    ## End - Security

    location ~*  \.(jpg|jpeg|png|gif|ico|css|js)$ {
        expires 365d;
    }
}
```

>>> WordPress: https://codex.wordpress.org/Nginx

## Check Config

```
sudo nginx -t
```

## Firewall

```
sudo ufw allow 80
```
