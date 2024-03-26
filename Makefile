# Handy shortcuts to build this

TAG := ghcr.io/lmartinking/kdb-container:latest

.PHONY: container
container: Containerfile entrypoint.sh l64.zip
	buildah build --squash -t $(TAG)

l64.zip:
	@[ ! -f l64.zip ] && echo "You need to download l64.zip from Kx Systems"
	@[ ! -f l64.zip ] && exit 1
	@echo "Found l64.zip"

.PHONY: k3s-import
k3s-import:
	podman save $(TAG) | sudo k3s ctr images import -
