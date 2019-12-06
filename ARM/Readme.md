# ARM Lab Setup

Basic ARM lab setup to program and debug arm programs using qemu chroot voodoo

## Instructions
You just need to run few commands to start working on arm userland

- First provision the vagrant virtual machine by running
```bash
vagrant up
```

- After the machine is provisioned completly, ssh into the box using
```bash
vagrant ssh
```

- Now start the arm container using systemd-nspawn
```bash
sudo systemd-nspawn -D /opt/armel_chroot
```

Done, Happy Hacking!
