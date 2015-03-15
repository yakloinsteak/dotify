name "headless_workstation"

description "Headless Workstation"

run_list(
  "main::packages",
  "ssh",
  'zsh',
  'git::blackman',
  "tmux",
  "vim",
  "main::dotfiles",
  "aws-tools",
  "rvm::user",
  "heroku",
  "redis2",
  "mpd",
  'ack',
  "wemux"
)

default_attributes({
  'gui_packages' => false,
  'homedir'   => '/home/blackman',
  'group'     => 'blackman',
  'username'  => 'blackman',
  'full_name' => 'Todd Blackman',
  'rvm' => {
    'user_installs' => [
      {
        'user'         => 'blackman',
        'version'      => 'head',
        'branch'       => 'stable',
        'default_ruby' => 'ruby-2.0.0',
        'rubies'       => ['ruby-2.0.0', 'ruby-1.9.3', 'ruby-2.2.0', 'ruby-2.1.5']
      }
    ]
  },

  'oh_my_zsh' => {
    'users' => [
      {
        'login'   => 'blackman',
        'theme'   => 'fox',
        'plugins' => %w(git rails ruby gem vi-mode rvm cap rvm bundler rake rsync colorize tmux),
        'home'    => '/home/blackman'
      }
    ]
   }
})
