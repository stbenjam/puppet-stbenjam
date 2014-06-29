class stbenjam::user { 

  # User creation and configuration
  package { $stbenjam::shell_package:
    ensure      => installed,
  } ->
  group { $stbenjam::username:
    ensure      => present,
    gid         => $stbenjam::uid,
  } ->
  user { $stbenjam::username:
    ensure      => present,
    managehome  => true,
    password    => $stbenjam::password,
    uid         => $stbenjam::uid,
    gid         => $stbenjam::gid,
    shell       => $stbenjam::shell_binary,
  } -> 
  file { "$stbenjam::home/.zshrc":
    ensure  => present,
    owner   => $stbenjam::username,
    group   => $stbenjam::username,
    mode    => '0644',
    source  => 'puppet:///modules/stbenjam/zshrc',
  }


}
