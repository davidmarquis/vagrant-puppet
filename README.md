# Fully functional Puppet testing environment using Vagrant

a.k.a. Awesomeness in a box

This repo allows testing of your Puppet manifests and modules in a fully isolated local environment managed
by [Vagrant](http://www.vagrantup.com/). The setup covers general Puppet best practices such as externalizing
your environment data into Hiera. A sample fileserver is also setup if you need it.

The configuration bundled in this sample setup will install and configure a base MySQL server on your Vagrant virtual
machine. This is here for demonstration purposes only; you will obviously change this to whatever your needs are.

As with any great things in life, please enjoy responsibly!

## How to use?

### Dependencies

1. Install [Vagrant](http://www.vagrantup.com/)
1. Optionally, install VirtualBox (to manage Vagrant boxes or otherwise just see them)
1. Install [Puppet 3.x](http://docs.puppetlabs.com/guides/installation.html)
1. Install [librarian-puppet](https://rubygems.org/gems/librarian-puppet-maestrodev)
   I strongly suggest installing the `maestrodev` fork of librarian-puppet because it seems to fix a few module
   versions issues compared to the original.
1. On the command line, navigate to the "puppet" directory (`cd puppet`)
1. Run `librarian-puppet install` to install all Puppet module dependencies

### Starting your first VM

Please note that this sample environment uses CentOS 6.4 as a base Vagrant box. You can use whichever you need by changing
it in `Vagrantfile`.

- Run `vagrant up` to startup your VM. On the first run, it'll download the box image file so prepare to wait a bit.
- Once a box is started, you may just run `vagrant provision` to re-run Puppet on the host
- To re-create your VM from scratch, run `vagrant destroy` followed by `vagrant up`

## Best practices

### Version control your Puppet manifests

The `/puppet` directory that's included in this repository is included for simplicity of kickstarting the project on your
computer. What you'd generally do is have everything under the `/puppet` directory be its own Git repo, and clone that
repository into the `/puppet` directory here.

Then on your production Puppetmaster, you would use this repository's `master` branch as your production Puppet manifests
 and modules.

By making all your changes in specific Git branches, you can safely test those changes using Vagrant, then
promote them to production by merging to `master` when ready. Then on your Puppetmaster, `git pull` to get the latest
(and, more importantly, tested!) code.

### Testing multiple servers

In this project, Hiera is configured to use the box's host name as a way of selecting the right YAML files to use. This is
a good practice to follow as it allows for much easier node configuration. Setting it up this way also allows you to select
the box you want to test by simply changing Vagrant's `config.vm.hostname` configuration in `Vagrantfile`.

