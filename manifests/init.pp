class stbenjam (
  $username        = $stbenjam::params::username,
  $uid             = $stbenjam::params::uid,
  $gid             = $stbenjam::params::gid,
  $home            = $stbenjam::params::home,
  $shell_binary    = $stbenjam::params::shell_binary,
  $shell_package   = $stbenjam::params::shell_package,
  $packages        = $stbenjam::params::packages,
) inherits stbenjam::params { 

  package { $packages: 
    ensure => installed,
  } ->
  class { 'stbenjam::user': } -> 
  class { 'stbenjam::bin': } -> 
  class { 'stbenjam::git': } ->
  class { 'stbenjam::vim': } ->
  class { 'stbenjam::screen': } 

}
