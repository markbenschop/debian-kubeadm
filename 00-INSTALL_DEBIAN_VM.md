# Setup a debian vm
Install a vm with kvm or virtualbox from a netinstall iso.
We need at least 2048 mb of memory and 2 cpus is better than one.

Here are the answers for the installation questions.

In debian installation menu kies choose 'install' (not graphical install)

Language: English

Country: Other

Continent: Europe

Country: Netherlands

Country or base default locale : United States

Keymap: American English

Hostname: kube

Domainname: empty

Choose password for root

chosse password for your own user

At setting up the clock press enter to skip

Partitioning method: Guided- use entire disk

Select disk

Partitioning scheme: All files in one partition

Finish partitioning and write changes to disk

Scan another dvd: No

Choose a dutch debian mirror

No proxy

Participate in package usages survey: no

At menu choose software to install

Select only SSH server and standard system utilities

Navigate by arrows and (de)select with space bar, [tab] to continue

Install GRUB to master boot record: yes

Choose your disk

press continue to reboot
