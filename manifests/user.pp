class stbenjam::user { 

  define create_user {

    if ($::ipa_registered == 'false') {
      user { $stbenjam::username:
        ensure      => present,
        managehome  => true,
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
