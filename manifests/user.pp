class stbenjam::user { 

  define create_user {

    if ($::ipa_registered == 'false') {
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
      }
    }

  }

  package { $stbenjam::shell_package:
    ensure      => installed,
  } ->

  create_user { "user": } ->

  file { "$stbenjam::home/.zshrc":
    ensure  => present,
    owner   => $stbenjam::username,
    group   => $stbenjam::username,
    mode    => '0644',
    source  => 'puppet:///modules/stbenjam/junk-drawer/dotfiles/zshrc',
  }


}
