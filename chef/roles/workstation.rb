name "workstation"

description "Workstation"

run_list(
  "main",
  'zsh',
  "tmux",
  "redis2",
  "aws-tools",
  "vim",
  "rvm::user"
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
        'rubies'       => ['ruby-2.0.0']
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
