class stbenjam::screen {

  # Screen Configuration
  package { "screen":
    ensure      => installed,
  } ->
  file { "$stbenjam::home/.screenrc":
    ensure  => present,
    owner   => $stbenjam::username,
    group   => $stbenjam::username,
    mode    => '0644',
    source  => 'puppet:///modules/stbenjam/screenrc',
  }

}
