# ansible-cfme

Install and configure CloudForms Management Engine environment from source.  Uses [Ansible](http://ansible.cc/) as an alternative to Puppet.

## ansible-cfme repository/structure

 * files - files and templates for use in playbooks/tasks
 * group_vars - customize deployment by setting/replacing variables
 * library - library of custom local ansible modules
 * tasks - snippets of tasks that should be included in plays
 * vars - os_release specific customizations

## Dependencies
 * [ansible-1.2](https://github.com/ansible/ansible) (or newer)
 * Access to the [CFME private repo](https://github.com/ManageIQ/cfme)

## Instructions
1. Clone this repo

        git clone https://github.com/aweiteka/ansible-cfme.git

2. Obtain a [GitHub Personal API Access Tokens](https://github.com/settings/applications).  This is required to download the cfme private repo.
3. Run the playbook:

        ansible-playbook -i inventory -e "github_token=<my_github_token>" site.yml

4. Optional: To install VMWare VDDK (will reboot system) ...

        $HOME/install_vddk.sh http://url/to/vmware-vix-disklib.tar

5. Start CFME:

        cd /var/www/miq/vmdb
        bin/rake evm:start

## What the installer does
1. Installs all dependent packages and CFME source
2. Starts postgresql and creates database
3. Installs ruby in rbenv and performs a bundle install
4. Replaces `/etc/sysconfig/iptables` to manage firewall.

## Issues and TODO
 * The github hosted ruby gem "net-ldap" returns unidentified UTF8 string during bundle install that Ansible cannot handle. The gemfile is updated to use the vendor gem as a workaround.
 * Find a more elegant way to setup ruby environment. Perhaps, ansible modules (rbenv, gem and/or bundle)?
 * Support ruby rvm environment.
 * This is generally a work in progress.

Please send me feedback at [aweiteka@redhat.com](mailto:aweiteka@redhat.com) with issues or suggestions. Pull requests encouraged!
