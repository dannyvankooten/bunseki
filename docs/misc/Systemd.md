# Managing the Bunseki process with Systemd

To run Bunseki as a service (so it keeps on running in the background and is automatically restarted in case of a server reboot) on Ubuntu 16.04 or later, first ensure you have the `bunseki` binary installed and in your `$PATH` so that the command exists.

Then, create a new service config file in the `/etc/systemd/system/` directory.

Example file: `/etc/systemd/system/bunseki.service`

The file should have the following contents, with `$USER` substituted with your actual username.

```
[Unit]
Description=Starts the bunseki server
Requires=network.target
After=network.target

[Service]
Type=simple
User=$USER
Restart=always
RestartSec=6
WorkingDirectory=/etc/bunseki # (or where bunseki should store its files)
ExecStart=bunseki server

[Install]
WantedBy=multi-user.target
```

Save the file and run `sudo systemctl daemon-reload` to load the changes from disk. 

Then, run `sudo systemctl enable bunseki` to start the service whenever the system boots.

### Starting or stopping the Bunseki service manually
```
sudo systemctl start bunseki
sudo systemctl stop bunseki
```

### Using a custom configuration file

If you want to [modify the configuration values for your Bunseki service](../Configuration.md), then change the line starting with `ExecStart=...` to include the path to your configuration file.

For example, if you have a configuration file `/home/john/bunseki.env` then the line should look like this:

```
ExecStart=bunseki --config=/home/john/bunseki.env server --addr=:9000
```

#### Start Bunseki automatically at boot
```
sudo systemctl enable bunseki
```

#### Stop Bunseki from starting at boot

```
sudo systemctl disable bunseki
```
