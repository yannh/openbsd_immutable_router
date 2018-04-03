#!/usr/bin/make -f

.PHONY: clean build

clean:
	rm -rf output-qemu

build: clean
	packer build -var-file=config.json -on-error=ask openbsd.json
