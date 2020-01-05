# Installation instructions for Bunseki

To install Bunseki on your server: 

1. [Download the latest Bunseki release](https://github.com/dannyvankooten/bunseki/releases) suitable for your platform.
2. Extract the archive to `/usr/local/bin`

```sh
tar -C /usr/local/bin -xzf bunseki_$VERSION_$OS_$ARCH.tar.gz
chmod +x /usr/local/bin/bunseki
```

Confirm that Bunseki is installed properly by running `bunseki --version`

```sh
$ bunseki --version
Bunseki version 1.0.0
```

## Configuring Bunseki

> This step is optional. By default, Bunseki will use a SQLite database file in the current working directory.

To run the Bunseki web server we will need to [configure Bunseki](Configuration.md) so that it can connect with your database of choice. 

Let's create a new directory where we can store our configuration file & SQLite database.

```
mkdir ~/my-bunseki-site
cd ~/my-bunseki-site
```

Then, create a file named `.env` with the following contents.

```
BUNSEKI_SERVER_ADDR=9000
BUNSEKI_GZIP=true
BUNSEKI_DEBUG=true
BUNSEKI_DATABASE_DRIVER="sqlite3"
BUNSEKI_DATABASE_NAME="bunseki.db"
BUNSEKI_SECRET="random-secret-string"
```

If you now run `bunseki server` then Bunseki will start serving up a website on port 9000 using a SQLite database file named `bunseki.db`. If that port is exposed then you should now see your Bunseki instance running by browsing to `http://server-ip-address-here:9000`.

Check out the [configuration file documentation](Configuration.md) for all possible configuration values, eg if you want to use MySQL or Postgres instead.

## Register your admin user

> This step is optional. If you don't register any users, your Bunseki dashboard will be public and you won't be able to add sites via the web interface.

To register a user in the Bunseki instance we just created, run the following command from the directory where your `.env` file is. 

```
bunseki user add --email="john@email.com" --password="strong-password"
```

**Note:** if you're running Bunseki v1.0.1 or older, the command is `bunseki register --email="john@email.com" --password="strong-password"`

## Using NGINX with Bunseki

We recommend using NGINX with Bunseki, as it simplifies running multiple sites from the same server and handling SSL certificates with LetsEncrypt.

Create a new file in `/etc/nginx/sites-enabled/my-bunseki-site` with the following contents. Replace `my-bunseki-site.com` with the domain you would like to use for accessing your Bunseki installation.

```sh
server {
	server_name my-bunseki-site.com;

	location / {
		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header X-Forwarded-For $remote_addr;
		proxy_set_header Host $host;
		proxy_pass http://127.0.0.1:9000; 
	}
}
```

Test your NGINX configuration and reload NGINX.

```
nginx -t
service nginx reload
```

If you now run `bunseki server` again, you should be able to access your Bunseki installation by browsing to `http://my-bunseki-site.com`.

## Automatically starting Bunseki on boot

To ensure the Bunseki web server keeps running whenever the system reboots, we should use a process manager. Ubuntu 16.04 and later ship with Systemd.

Create a new file called `/etc/systemd/system/my-bunseki-site.service` with the following contents. Replace `$USER` with your actual username.

```
[Unit]
Description=Starts the bunseki server
Requires=network.target
After=network.target

[Service]
Type=simple
User=$USER
Restart=always
RestartSec=3
WorkingDirectory=/home/$USER/my-bunseki-site
ExecStart=/usr/local/bin/bunseki server

[Install]
WantedBy=multi-user.target
```

Reload the Systemd configuration & enable our service so that Bunseki is automatically started whenever the system boots.

```
systemctl daemon-reload
systemctl enable my-bunseki-site
```

You should now be able to manually start your Bunseki web server by issuing the following command.

```
systemctl start my-bunseki-site
```

## Tracking snippet

To start tracking pageviews, copy the tracking snippet shown in your Bunseki dashboard to all pages of the website you want to track.


### SSL certificate

With [Certbot](https://certbot.eff.org/docs/) for LetsEncrypt installed, adding an SSL certificate to your Bunseki installation is as easy as running the following command.

```
certbot --nginx -d my-bunseki-site.com
```


