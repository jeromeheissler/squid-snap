# squid-snap

squid cahcing proxy server packaged as a snap for Ubuntu core.

## How to install

After first time installation, please run the following command to let squid work for you.
$ sudo snap disable squid
$ sudo snap connect squid:firewall-control :firewall-control
$ sudo snap connect squid:network-control :network-control
$ sudo snap connect squid:process-control :process-control
$ sudo snap enable squid

Or simple run 
$ sudo snap-connect.sh

Only amd64 target is supported at this moment.

## Todo
need to support to setup configuration for squid cahce server via snapctl.


