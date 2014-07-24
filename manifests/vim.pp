class stbenjam::vim {

  augeas { 'root-sudo-tty':
    context => '/files/etc/sudoers',
    changes => [
      "set Defaults[type = ':root']/type :root",
      "set Defaults[type = ':root']/requiretty/negate ''",
    ]
  } ->
  
  package { "vim-enhanced":
    ensure  => installed,
  } ->

  file { ["$stbenjam::home/.vim", "$stbenjam::home/.vim/colors"]:
    ensure  => directory,
    owner   => $stbenjam::username,
    group   => $stbenjam::username,
    mode    => '0755',
  } ->

  file { "$stbenjam::home/colors/solarized.vim":
    ensure  => present,
    owner   => $stbenjam::username,
    group   => $stbenjam::username,
    mode    => '0644',
    source  => 'puppet:///modules/stbenjam/vim-colors-solarized/colors/solarized.vim',
  } ->

  file { "$stbenjam::home/.vimrc":
    ensure  => present,
    owner   => $stbenjam::username,
    group   => $stbenjam::username,
    mode    => '0644',
    source  => 'puppet:///modules/stbenjam/junk-drawer/dotfiles/vimrc',
  }

  exec { "install_plugins":
    command     => "/usr/bin/sudo /bin/su $stbenjam::username /bin/bash --login -c \"vim +:PluginInstall +:qall\"",
    subscribe   => File["$stbenjam::home/.vimrc"],
    refreshonly => true
  }

}
