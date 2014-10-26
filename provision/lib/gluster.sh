

gluster_setup_datastore() {
	cp -f $PROVISION_DATA/gluster_datastore.vol \
		/etc/glusterfs/datastore.vol

	if ! grep -q ':www-volume' /etc/fstab ; then
		cat $PROVISION_DATA/gluster_www_volume_fstab >> /etc/fstab
	fi
}

gluster_create_www_volume() {
	mkdir -p /srv/gluster/www-volume

	gluster volume create www-volume \
		replica 2 \
		transport tcp \
		lb1master.glenux.net:/srv/gluster/www-volume \
		lb1slave.glenux.net:/srv/gluster/www-volume

	gluster volume start www-volume

	gluster volume set www-volume auth.allow $(resolveip -s lb1master.glenux.net),$(resolveip -s lb1slave.glenux.net)

	gluster volume info www-volume
	mount localhost:www-volume
}

