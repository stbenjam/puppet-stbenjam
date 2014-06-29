class stbenjam (
  $username        = $stbenjam::params::username,
  $password        = $stbenjam::params::password,
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
  class { 'stbenjam::git': } ->
  class { 'stbenjam::vim': } ->
  class { 'stbenjam::screen': } 

}
