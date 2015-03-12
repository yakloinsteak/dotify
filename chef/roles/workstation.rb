name "workstation"

description "Workstation"

run_list(
  "main",
  'zsh',
  "tmux",
  "aws-tools",
  "vim",
  "rvm::user",
  "heroku",
  "redis2",
  "mpd"
)

default_attributes({
  'homedir'  => '/home/blackman',
  'group'    => 'blackman',
  'username' => 'blackman',
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
