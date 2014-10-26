## install base packages
class customer::packages {
  package {
    "vim":
      ensure => installed;
    "w3m":
      ensure => installed;
    "rsync":
      ensure => installed;
    "proftpd":
      ensure => installed;
    "unzip":
      ensure => installed
  }
}


node "lb1slave" {

  class{ "apt":  always_apt_update => true; }
  apt::key {
    "B98321F9":
      key_source => "https://ftp-master.debian.org/keys/archive-key-6.0.asc";
    "473041FA":
      key_source => "https://ftp-master.debian.org/keys/archive-key-6.0.asc";
    "F42584E6":
      key_source => "https://ftp-master.debian.org/keys/archive-key-6.0.asc"
  }
  Apt::Key <| |> -> Exec["apt_update"]
  Exec["apt_update"] -> Package <| |>


  include customer::packages
}

Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }  

hiera_include('classes')

