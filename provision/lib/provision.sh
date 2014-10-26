

PROVISION_HASH=$(sha1sum $0 |awk '{ print $1; }')
PROVISION_LOCK=/var/lock/provision
PROVISION_STEP=""

set -u

provision_load() {
	for lib in $PROVISION_LIB/*.sh; do
		. $lib
	done
}

