# ansible-cfme

Install and configure CloudForms Management Engine environment from source. Uses [Ansible](http://ansible.cc/) as an alternative to Puppet.

## Dependencies
 * Tested on Fedora 18
 * `yum install -y ansible`
 * Access to the [cfme private repo](https://github.com/ManageIQ/cfme)

## Instructions
1. Clone this repo `git clone https://github.com/aweiteka/ansible-cfme.git`
2. Add lines to `/etc/ansible/hosts` for local install

        [local]
        127.0.0.1

3. Create and copy your [GitHub auth token](https://github.com/settings/applications). This is required to download the cfme private repo.
4. Run as `ansible-playbook <path/to/cfme.yml> -e "github_token=<my_github_token"`. May be run multiple times.
5. To install VMWare vddk run `$HOME/install_vddk.sh http://url/to/vmware-vix-disklib.tar (will reboot)`
6. Start CFME: from `/var/www/cfme/vmdb` run `bin/rake evm:start`

## What the installer does
1. Installs all dependent packages and CFME source
2. Starts postgresql and creates database
3. Installs ruby in rbenv and performs a bundle install
4. Replaces `/etc/sysconfig/iptables` to manage firewall.

## Issues and TODO
 * The github hosted ruby gem "net-ldap" returns unidentified UTF8 string during bundle install that Ansible cannot handle. The gemfile is updated to use the vendor gem as a workaround.
 * Find a more elegant way to setup rbenv. Ansible module?
 * Support ruby rvm environment.
 * Support RHEL and beyond. Debian, anyone?
 * This is generally a Work in progress.

Please send me feedback at [aweiteka@redhat.com](mailto:aweiteka@redhat.com) with issues or suggestions. Pull requests encouraged!
