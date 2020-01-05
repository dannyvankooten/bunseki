# Updating Bunseki to the latest version

To update your existing Bunseki installation to the latest version, first rename your existing Bunseki installation so that we can move the new version in its place.

```
mv /usr/local/bin/bunseki /usr/local/bin/bunseki-old
```

Then, [download the latest release archive suitable for your system architecture from the releases page](https://github.com/dannyvankooten/bunseki/releases/latest) and place it in `/usr/local/bin`.

```
tar -C /usr/local/bin -xzf bunseki_$VERSION_$OS_$ARCH.tar.gz
chmod +x /usr/local/bin/bunseki
``` 

If you now run `bunseki --version`, you should see that your system is running the latest version. 

```
$ bunseki --version
Bunseki version 1.0.0
```


### Restarting your Bunseki web server

To start serving up the updated Bunseki web application, you will have to restart the Bunseki process that is running the web server.

If you've followed the [installation instructions](Installation%20instructions.md) then you are using Systemd to manage the Bunseki process. Run `systemctl restart <your-bunseki-service>` to restart it.

```
systemctl restart my-bunseki-site
```

Alternatively, kill all running Bunseki process by issuing the following command.

```
pkill bunseki
```
