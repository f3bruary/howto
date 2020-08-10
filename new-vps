## I got myself a new VPS !

I find myself firing up new vps'es ? vps' ? whatever, you know what I mean, all the time. Sometimes I have to move my own servers, sometimes I need to create new servers for clients. The 'first things to do after installing `insert distro here` tasks are common and have become so boring, yet I always forget which steps to exactly take. Which commands to run. What the package name were again. Or which site I consulted for task X.

So I decided to create a little manual with all the commands I use to set up the basic stuff.

Feel free to use. Don't feel free to mail me with questions.

Right, moving on. We purchased our new VPS and we received our email with the login info.

```
Dear Customer,

You are nothing but a number to us.

Thanks for your money. Here are the credentials for your underspecced server:

Username: root
Password: strokemehard
Server IP: 69.69.69.69
```

Now that we have our login info, we can access the terminal through SSH.

### Update the System

```
apt-get update &&  apt-get -y upgrade
```

### Install Packages

Let's install some popular packages

```
apt-get -y install sudo vim tmux zsh host whois git ufw htop python-setuptools python-dev build-essential
```

### User Management

We shouldn't be using root all the time. So let's create a new user.

```
adduser f3bruary
```

Just hit enter through the settings. And pick a strong passphrase. Now that we have our new user, we need to make sure it has sudo privileges so we won't have to depend on root anymore.

```
cat /etc/sudoers
```
```
...SNIP...

# Allow members of group sudo to execute any command                                                                                                                           
%sudo   ALL=(ALL:ALL) ALL
```

And then add our user to the sudo group.

```
sudo usermod -aG sudo f3bruary
```

From now on we can login using this user instead of root. And our commands will now start with `sudo` when necessary.

### Secure SSH

We need to secure our SSH server. That's it. I don't know what else to say about this anymore. It needs to be done. Do it.

Create a new key-pair on your ***client machine***. I like to keep the keys in ~/.ssh/ but you do you. Just name it something so you know what key is what for when you're using multiple keys.

```
ssh-keygen -t rsa -b 4096
```

This will generate a private and public key file. The public file is the one we want to share and it has the .pub extension. Copy the contents of the .pub file and paste it onto our VPS in the file `~/.ssh/authorized_keys`

Now we will harden the config. (lol, 'harden'...)

We can't append config rules with `echo` and I don't like using `sed` for this part either. So I'll just show what needs to be present in `/etc/ssh/sshd_conf`

```
Port 8022			# Define a Port
PermitRootLogin no		# Forbid Root Login
PubkeyAuthentication yes	# Enable Key Authentication
PasswordAuthentication no	# Disable Passwords (cause we're using keys, duhhh..)
PermitEmptyPasswords no		# Not sure if it's even necessary with the above settings, but oh well
X11Forwarding no		# Just because
Protocol 2			# Safer encryption
AllowUsers f3bruary		# Only I Shall Pass !
```

Now restart.

```
sudo systemctl restart ssh
```

And re-connect on the new port with our key !

## Firewall

I like using UFW for this because it's simple.

### Adding Rules

```
sudo ufw disable
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
#sudo ufw allow port/tcp
#sudo ufw allow from 0.0.0.0
#sudo ufw allow from 0.0.0.0/24 to any port 22
sudo ufw enable
```

### Removing Rules

```
sudo ufw status numbered
sudo ufw delete [n]
```
