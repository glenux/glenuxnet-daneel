
apache_enable_plugins() {
	# make sure php5 is active
	a2enmod php5
	service apache2 reload
}

apache_setup_syncconfig() {
	# require gluster www-volume
	if [ ! -f /srv/www-volume/etc/apache2 ]; then
		mkdir -p /srv/www-volume/etc/
		mv /etc/apache2 /srv/www-volume/etc/apache2
	fi
}

apache_link_syncconfig() {
	ln -s /srv/www-volume/etc/apache2 /etc/apache2
}

