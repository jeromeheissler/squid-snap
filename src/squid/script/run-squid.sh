#!/bin/sh

test -d ${SNAP_DATA}/etc || mkdir -p ${SNAP_DATA}/etc
test -d ${SNAP_DATA}/var/run || mkdir -p ${SNAP_DATA}/var/run
test -d ${SNAP_DATA}/var/log/squid || mkdir -p ${SNAP_DATA}/var/log/squid
test -d ${SNAP_DATA}/var/spool/squid || mkdir -p ${SNAP_DATA}/var/spool/squid
test -f ${SNAP}/etc/squid.conf || sed -e "s|\${SNAP_DATA}|$SNAP_DATA|" ${SNAP}/etc/squid.conf.template > ${SNAP_DATA}/etc/squid.conf

create_swap_directories() {
    if [ "$(find $SNAP_DATA/var/spool/squid/ -maxdepth 1 -type d -printf 1 | wc -m)" -eq 1 ] ; then
        squid -z -f ${SNAP_DATA}/etc/squid.conf
         #waiting for a long time to make sure the directories are created 
         #to avoid fatal error occurs when squid startup.
        sleep 10
    fi
}

launch_in_debug_mode() {
    squid -NCd1 -f ${SNAP_DATA}/etc/squid.conf
}

launch_in_release_mode() {
    squid -N -f ${SNAP_DATA}/etc/squid.conf
}

create_swap_directories

echo "launch squid."
launch_in_debug_mode
