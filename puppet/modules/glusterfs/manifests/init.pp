
class glusterfs::client {
  package {
    "glusterfs-server":
      ensure => installed
  }
}

class glusterfs::server {
  package {
    "glusterfs-client":
      ensure => installed
  }
}

