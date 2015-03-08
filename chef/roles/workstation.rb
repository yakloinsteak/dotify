name "workstation"
description "Workstation"
run_list(
  "main",
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
  }
})
