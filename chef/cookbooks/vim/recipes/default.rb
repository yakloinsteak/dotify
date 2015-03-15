SYNC = false

include_recipe "git"

apt_package 'vim'
apt_package 'exuberant-ctags'

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
  action :create_if_missing
end

execute "chown #{node['username']}:#{node['group']} -R #{node['homedir']}/.vim"

vim_modules = {
  "AutoFenc"          => 'https://github.com/vim-scripts/AutoFenc.vim.git',
  "ack"               => 'https://github.com/mileszs/ack.vim.git',
  "bundler"           => 'git://github.com/tpope/vim-bundler.git',
  "colorschemes"      => 'https://github.com/flazz/vim-colorschemes.git',
  "conflict-motions"  => 'https://github.com/vim-scripts/ConflictMotions.git',
  "ctrlp"             => 'https://github.com/kien/ctrlp.vim.git',
  "easy_motion"       => 'https://github.com/Lokaltog/vim-easymotion.git',
  "eunuch"            => 'https://github.com/tpope/vim-eunuch.git',
  "fakeclip"          => 'http://github.com/kana/vim-fakeclip.git',
  "gnupg"             => 'https://github.com/vim-scripts/gnupg.vim.git',
  "haml"              => 'https://github.com/tpope/vim-haml.git',
  "html5"             => 'https://github.com/othree/html5.vim.git',
  "indent-object"     => 'https://github.com/michaeljsmith/vim-indent-object.git',
  "join"              => 'https://github.com/sk1418/Join.git',
  "linediff"          => 'https://github.com/AndrewRadev/linediff.vim.git',
  "markdown"          => 'https://github.com/tpope/vim-markdown.git',
  "monit"             => 'https://github.com/tmatilai/vim-monit.git',
  "nerdtree"          => 'https://github.com/scrooloose/nerdtree.git',
  "nginx-syntax"      => 'https://github.com/evanmiller/nginx-vim-syntax.git',
  "rails"             => 'git://github.com/tpope/vim-rails.git',
  "rubocop"           => 'https://github.com/lad/vim-rubocop.git',
  "ruby-doc"          => 'git://github.com/lucapette/vim-ruby-doc.git',
  "scratch"           => 'https://github.com/vim-scripts/scratch.vim.git',
  "slim"              => 'https://github.com/slim-template/vim-slim.git',
  "slime"             => 'https://github.com/jpalardy/vim-slime.git',
  "syntastic"         => 'https://github.com/scrooloose/syntastic.git',
  "tagbar"            => 'https://github.com/majutsushi/tagbar.git',
  "textobj-rubyblock" => 'https://github.com/nelstrom/vim-textobj-rubyblock.git',
  "textobj-user"      => 'git://github.com/kana/vim-textobj-user.git',
  "ultisnips"         => 'https://github.com/SirVer/ultisnips',
  "cucumber"          => 'https://github.com/tpope/vim-cucumber.git',
  "vinegar"           => 'https://github.com/tpope/vim-vinegar.git',
  "yankring"          => 'https://github.com/vim-scripts/YankRing.vim.git',
  "you-complete-me"   => 'https://github.com/Valloric/YouCompleteMe.git'
}

vim_modules.each do |name,repo|
  git "#{node['homedir']}/.vim/bundle/#{name}" do
    repository repo
    user node['username']
    group node['group']
    reference "master"
    action :sync

    unless SYNC
      not_if { File.exists? "#{node['homedir']}/.vim/bundle/#{name}" }
    end
  end
end

apt_package 'cmake'

execute "Sync submodules for YouCompleteMe" do
  command "cd #{node['homedir']}/.vim/bundle/you-complete-me && git submodule init && git submodule update --init --recursive"
  not_if { File.exists? "#{node['homedir']}/.vim/bundle/you-complete-me/third_party/ycmd" }
end

execute "Compile YouCompleteMe" do
  command "cd #{node['homedir']}/.vim/bundle/you-complete-me && ./install.sh --clang-completer"
  not_if { File.exists? "#{node['homedir']}/.vim/bundle/you-complete-me/third_party/ycmd" }
end

#########################
# Completion with eclim #
#########################

directory "#{node['homedir']}/tools" do
  user node['username']
  group node['group']
end

execute 'Get eclipse for eclim/vim usage' do
   command 'cd /usr/local/src && wget http://ftp.osuosl.org/pub/eclipse/technology/epp/downloads/release/luna/SR2/eclipse-java-luna-SR2-linux-gtk-x86_64.tar.gz'
   not_if  { File.exists? '/usr/local/src/eclipse-java-luna-SR2-linux-gtk-x86_64.tar.gz' }
end

execute "Install eclipse" do
  command 'cd /usr/local && tar -zxvf src/eclipse-java-luna-SR2-linux-gtk-x86_64.tar.gz'
  not_if { File.exists? '/usr/local/eclipse/eclipse' }
end

execute "Get eclim" do
  command "cd #{node['homedir']}/tools && wget http://downloads.sourceforge.net/project/eclim/eclim/2.4.1/eclim_2.4.1.jar?r=http%3A%2F%2Feclim.org%2Finstall.html&ts=1422211131&use_mirror=tcpdiag"
  not_if { File.exists? "cd #{node['homedir']}/tools/eclim_2.4.1.jar" }
end

file "#{node['homedir']}/tools/README" do
  content "run\njava -jar eclim_2.4.1.jar\nto set up eclim. Set up eclipse first."
end

# TODO: Leverage server if available and env var set
