export DEBIAN_FRONTEND=noninteractive

apt_prepare() {
	# make sure there is no dangling package
	dpkg --configure -a

	# update before anything else
	apt-get update

	# finalize broken installations
	apt-get -f install -q -y 
}

apt_install() {
	apt-get install -q -y $*
}
