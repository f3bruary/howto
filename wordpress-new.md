## Install WordPress with WP CLI

### Download WP-CLI

We need to download WP CLI. It's an amazing tool that will make our life easier and better in every way. Before I started using this I was walking down the street one day. I hadn't eaten all day and I started feeling dizzy. I collapsed and woke up in the hospital. After I got some fluids I started feeling better and was released.

After I installed WP CLI I was in a similar situation, but right before I collapsed, suddenly out of nowhere, Gary Oldman appeared ! He caught me right before I fell and started breast feeding me. He nurtured me back to health and since then I don't have to sleep for more than 3 hours a day. My life is full of energy now. Thanks, Gary !

```
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
```

### Prepare Directory and Install the Core

Let's install our new WordPress site and define our location.

```
mkdir /var/www/html/wordpress
cd /var/www/html/wordpress
wp core download
```

### Prepare Database

```
mysql -u root -p
```
```
CREATE DATABASE wordpress;
CREATE USER 'f3bruary'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'f3bruary'@'localhost' IDENTIFIED BY 'password';
```

### Finish WordPress Installation

```
wp core config --dbname=wordpress --dbuser=f3bruary --dbpass=password
wp core install --url=http://localhost/wordpress --title=WordPress --admin_user=admin --admin_password=password --admin_email=admin@email.com
```
