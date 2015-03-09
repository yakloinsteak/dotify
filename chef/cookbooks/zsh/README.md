# Description

It's a [chef](http://wiki.opscode.com/display/chef/Home) recipe

Install zsh package and use the [oh-my-zsh
plugin](https://github.com/robbyrussell/oh-my-zsh) to configure zsh

You can define it by configure like :

```
[:oh_my_zsh][:users] = [{
  :login => 'shingara',
  :theme => 'rachel',
  :plugins => ['gem', 'git', 'rails3', 'redis-cli', 'ruby'],
  :home => '/home/shingara' # optional
}]
```
*note:* if `home` not specified, the recipe will looking for home in `/etc/passwd`, but this not working for new created users. [see [#4](https://github.com/shingara/oh-my-zsh-chef)]


If you are behind firewall or proxy, also configure this :

```
[:oh_my_zsh][:repository] = "https://github.com/robbyrussell/oh-my-zsh.git"
```
