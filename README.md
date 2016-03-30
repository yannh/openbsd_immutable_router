# OpenBSD immutable router image

This repository contains a packer script followed by an Ansible provisioning script for the
automated creation of an immutable OpenBSD ISO image for my personal router.

The goal is to create in one single command an image that can then be copied to a USB stick
on which a router/computer can boot on.

The image is "immutable" in the sense that the whole system is read-only, with particular mount
points mounted as mfs, to allow small amounts of writes in memory filesystems. This prevents
writes on the USB stick, making it very resilient to hard reboots, easy to recreate, and enforces
the full state of the system.

This repository has been made public for educational purposes, to provide an example of a
working "immutable server", and inspire people to start working on similar architectures. It can
also serve as a good read on the basic configuration of OpenBSD as a router.

Use "packer" to generate the image file:

    packer build -var-file=config.json openbsd.json
