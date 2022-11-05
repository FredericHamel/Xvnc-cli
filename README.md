# Xvnc-cli
This is an unofficial extension of TigerVNC. This script allow using the xstartup file to setup a vnc session.
Xvnc-cli script is similar to the old vncserver program in [TigerVNC](https://github.com/TigerVNC/tigervnc).

# Build and installation

To build this script run the make command in the directory.

```sh
$ make
```


To install you can run this command. It will install the script in /usr/local/bin
```sh
$ sudo make install
```

You can specify an alternative prefix when running `make` through environment variable. The following
command will install Xvnc-cli in /usr/bin.
```sh
$ PREFIX=/usr make install
```

# Globals options

```
usage:  [:<display>]
        [-bg]
        [-use-xstartup]
        [-xstartup <file>]

        -kill <X-display>

        -list
```

# Example uses

This script uses the first available X11 display number when not supplied as argument.

Starting a VNC server using Xsession on the first available X11 display number.
```sh
$ Xvnc-cli
```

Starting a VNC server using Xsession on a specific display number.
```sh
$ Xvnc-cli :1
```

Starting a vnc server using the xstartup script located in `$HOME/.vnc/xstartup`.
```sh
$ Xvnc-cli -use-xstartup
```

Starting a VNC server in background
```sh
$ Xvnc-cli -bg -use-xstartup
```

Listing all running VNC server
```sh
$ Xvnc-cli -list

TigerVNC server sessions:

X DISPLAY #	PROCESS ID
:2		     27137
:1		     12504
```

# Notes
The xstartup script works best when starting a window manager such as Xmonad, dwm and others.
Some environment variable might need to be set for some programs to work.

For desktop environment such as kde or gnome-shell, it's better to start the VNC server using
Xsession without using any xstartup options.
