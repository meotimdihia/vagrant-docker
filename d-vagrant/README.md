Error happen when installation
-------------------------
Failed to mount folders in Linux guest. This is usually because
the "vboxsf" file system is not available. Please verify that
the guest additions are properly installed in the guest and
can work properly. The command attempted was .....

Try to fix that problem by ssh in vagrant box `vagrant ssh` then run command:  
`sudo ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions`
that is a virtualbox's problem.