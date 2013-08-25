# Testing environment for Puppet using Vagrant

a.k.a. Awesomeness in a box

This repo allows testing of our Puppet manifests and modules in a fully isolated local environment managed
by [Vagrant](http://www.vagrantup.com/). The setup covers general Puppet best practices such as externalizing
your environment data into Hiera. A sample fileserver is also setup if you need it.

Another best practice you'd generally follow is have everything in the `/puppet` directory be its own Git repo.
Then on your production Puppetmaster, you'd clone this repository into `/etc/puppet/...` and use it as your production
manifests and modules. By playing with Git branches, you can safely test changes to your Puppet code using Vagrant, then
promote those changes to production by merging with `master` when ready.

## How to use?

### Dependencies

1. Install [Vagrant](http://www.vagrantup.com/)
1. Optionally, install VirtualBox (to manage Vagrant boxes or otherwise just see them)
1. Install [Puppet 3.x](http://docs.puppetlabs.com/guides/installation.html)
1. Install [librarian-puppet](https://github.com/rodjek/librarian-puppet)
1. On the command line, navigate to the "puppet" directory (`cd puppet`)
1. Run `librarian-puppet install` to install all Puppet module dependencies

### Starting your first VM

- Run `vagrant up` to startup your VM. On the first run, it'll download the box image file so prepare to wait a bit.
- Once a box is started, you may just run `vagrant provision` to re-run Puppet on the host
- To re-create your VM from scratch, run `vagrant destroy` followed by `vagrant up`


Enjoy!
