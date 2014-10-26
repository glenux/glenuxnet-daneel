
user_add() {
	local username=$1
	adduser "$username" --disabled-password --gecos ""
}

user_passwd() {
	local username=$1
	local password=$2
	echo "$username:$password" |chpasswd
}
