class stbenjam::bin {

  file { "$stbenjam::home/bin":
    ensure  => directory,
    owner   => $stbenjam::username,
    group   => $stbenjam::username,
    mode    => '0755'
  } ->

  file { "$stbenjam::home/bin/selecta":
    ensure  => file,
    owner   => $stbenjam::username,
    group   => $stbenjam::username,
    source  => 'puppet:///modules/stbenjam/selecta/selecta',
  }

}
