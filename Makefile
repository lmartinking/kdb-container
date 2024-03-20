# Handy shortcuts to build this
	
.PHONY: container
container: Containerfile entrypoint.sh l64.zip
	buildah build --squash -t kdb

l64.zip:
	@[ ! -f l64.zip ] && echo "You need to download l64.zip from Kx Systems"
	@[ ! -f l64.zip ] && exit 1
	@echo "Found l64.zip"
