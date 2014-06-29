class stbenjam::git {

  file { "$stbenjam::home/.gitconfig":
    ensure  => present,
    owner   => $stbenjam::username,
    group   => $stbenjam::username,
    mode    => '0644',
    source  => 'puppet:///modules/stbenjam/gitconfig',
  }

  class { 'git::install': } ->

  git::repo { 'junk-drawer':
    target      => "$stbenjam::home/junk-drawer",
    source      => 'https://github.com/stbenjam/junk-drawer.git',
    user        => $stbenjam::username,
  } ->

  git::repo { 'vundle':
    target      => "$stbenjam::home/.vim/bundle/Vundle.vim",
    source      => 'https://github.com/gmarik/Vundle.vim.git',
    user        => $stbenjam::username,
  } ->

  git::repo { 'oh-my-zsh':
    target      => "$stbenjam::home/.oh-my-zsh",
    source      => 'https://github.com/robbyrussell/oh-my-zsh.git',
    user        =>  $stbenjam::username,
  } 

}
