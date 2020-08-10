## Add the Repo and Install Packages

```
sudo apt install ca-certificates apt-transport-https 
wget -q https://packages.sury.org/php/apt.gpg -O- | sudo apt-key add -
echo "deb https://packages.sury.org/php/ stretch main" | sudo tee /etc/apt/sources.list.d/php.list

sudo apt update
sudo apt install php7.2
```

## Install Extensions and FPM Support
```
sudo apt install php7.2-cli php7.2-common php7.2-curl php7.2-mbstring php7.2-xml php7.2-gd php7.2-zip php7.2-fpm
```

## Mysql Support
```
sudo apt-get install php7.2-mysql
```
