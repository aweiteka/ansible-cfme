# ansible-cfme

Install and configure CloudForms Management Engine environment from source. Uses [Ansible](http://ansible.cc/) as an alternative to Puppet.

## Dependencies
 * Tested on Fedora 18
 * `yum install -y ansible`
 * Access to the [cfme private repo](https://github.com/ManageIQ/cfme)

## Instructions
1. Clone this repo
2. Add lines to `/etc/ansible/hosts` for local install

        [local]
        127.0.0.1

3. Edit `cfme.yml` with your [GitHub auth token](https://github.com/settings/applications). This is required to download the cfme private repo.
4. Run as `ansible-playbook <path/to/cfme.yml>`. May be run multiple times.
5. To install VMWare vddk run `$HOME/install_vddk.sh http://url/to/vmware-vix-disklib.tar (will reboot)`

## TODO
 * Work in progress.

Please send me feedback at [aweiteka@redhat.com](mailto:aweiteka@redhat.com) with issues or suggestions. Pull requests encouraged!
