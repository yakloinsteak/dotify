include_recipe "git"

cookbook_file 'vimrc' do
  path node['homedir']+'/.vimrc'
  action :create_if_missing
end

cookbook_file 'gvimrc' do
  path node['homedir']+'/.gvimrc'
  action :create_if_missing
end

# .vim
remote_directory "#{node['homedir']}/.vim" do
  source 'vim'
  files_owner node['username']
  files_mode "644"
  files_group node['username']
  group node['group']
  owner node['username']
  action :create #_if_missing
end

directory "#{node['homedir']}/.vim/bundle" do
  recursive true
  group node['group']
  owner node['username']
end

vim_modules = {
  "AutoFenc"          => 'https://github.com/vim-scripts/AutoFenc.vim.git',
  "ack"               => 'https://github.com/mileszs/ack.vim.git',
  "bundler"           => 'git://github.com/tpope/vim-bundler.git',
  "colorschemes"      => 'git@github.com:flazz/vim-colorschemes.git',
  "conflict-motions"  => 'https://github.com/vim-scripts/ConflictMotions.git',
  "ctrlp"             => 'https://github.com/kien/ctrlp.vim.git',
  "easy_motion"       => 'https://github.com/Lokaltog/vim-easymotion.git',
  "eunuch"            => 'git@github.com:tpope/vim-eunuch.git',
  "fakeclip"          => 'http://github.com/kana/vim-fakeclip.git',
  "gnupg"             => 'https://github.com/vim-scripts/gnupg.vim.git',
  "haml"              => 'git@github.com:tpope/vim-haml.git',
  "html5"             => 'git@github.com:othree/html5.vim.git',
  "indent-object"     => 'https://github.com/michaeljsmith/vim-indent-object.git',
  "join"              => 'git@github.com:sk1418/Join.git',
  "linediff"          => 'https://github.com/AndrewRadev/linediff.vim.git',
  "markdown"          => 'git@github.com:tpope/vim-markdown.git',
  "monit"             => 'https://github.com/tmatilai/vim-monit.git',
  "nerdtree"          => 'https://github.com/scrooloose/nerdtree.git',
  "nginx-syntax"      => 'git@github.com:evanmiller/nginx-vim-syntax.git',
  "rails"             => 'git://github.com/tpope/vim-rails.git',
  "rubocop"           => 'git@github.com:lad/vim-rubocop.git',
  "ruby-doc"          => 'git://github.com/lucapette/vim-ruby-doc.git',
  "scratch"           => 'git@github.com:vim-scripts/scratch.vim.git',
  "slim"              => 'git@github.com:slim-template/vim-slim.git',
  "slime"             => 'git@github.com:jpalardy/vim-slime.git',
  "syntastic"         => 'git@github.com:scrooloose/syntastic.git',
  "tagbar"            => 'git@github.com:majutsushi/tagbar.git',
  "textobj-rubyblock" => 'https://github.com/nelstrom/vim-textobj-rubyblock.git',
  "textobj-user"      => 'git://github.com/kana/vim-textobj-user.git',
  "ultisnips"         => 'https://github.com/SirVer/ultisnips',
  "cucumber"          => 'https://github.com/tpope/vim-cucumber.git',
  "vinegar"           => 'git@github.com:tpope/vim-vinegar.git',
  "yankring"          => 'https://github.com/vim-scripts/YankRing.vim.git',
  "you-complete-me"   => 'git@github.com:Valloric/YouCompleteMe.git'
}

vim_modules.each do |name,repo|
  git "#{node['homedir']}/.vim/bundle/#{name}" do
    repository repo
    user node['username']
    group node['group']
    reference "master"
    action :sync
  end
end

# Vim completion
apt_package 'cmake'
#cd ~/.vim/bundle/YouCompleteMe
#git submodule --init --recursive
#./install.sh --clang-completer

# Leverage server if available and env var set
