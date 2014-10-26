
define user::password(
  $user="",
  $password=""
) {
  exec {"user::password::$user $password":
    command => "echo '$user:$password' |chpasswd"
  }
}

class user::setup {
  user { "admin":
    ensure => present,
    comment => "This user was created by Puppet",
    managehome => true
  }

  user::password{
    "root":
      user => "root",
      password => "lb1s_rtMAGNET" ;
    "admin":
      user => "admin",
      password => "lb1s_anMAGNET",
      require => User["admin"]
  }
}

