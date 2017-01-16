#!/bin/sh
sudo snap disable squid
sudo snap connect squid:firewall-control :firewall-control
sudo snap connect squid:network-control :network-control
sudo snap connect squid:process-control :process-control
sudo snap enable squid
