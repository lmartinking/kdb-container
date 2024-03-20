# kdb+ in a container

⚠️ Due to the proprietary nature of kdb+ I cannot provide publically available container images.

## Prerequisites

 * Buildah
 * KDB personal edition and licence, see: https://kx.com/kdb-personal-edition-download/
   - `l64.zip` -- kdb+ 4.x linux x86-64 edition

## Build

```
make
```

## Use

Ensure you have your licence base64 encoded and saved as `kc.lic.txt`.

```
podman run -p 5000:5000 -e KDB_LICENSE_B64=$( cat kc.lic.txt ) kdb
```

This will utilise the default startup command, which is `q -p 0.0.0.0:5000`.

## Import into K3S

If you build this on the machine which is hosting k3s, then you can use:

```
make k3s-import
```

To import the image into k3s. You will need to build it first.

