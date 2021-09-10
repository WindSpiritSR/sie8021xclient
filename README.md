## Install

### Debian/Ubuntu

```bash
sudo apt install autoconf libtool libpcap-dev libssl-dev pkg-config
git clone https://github.com/WindSpiritSR/sie8021xclient
cd ~/sie8021xclient
autoreconf --install
./configure
make
sudo make install
```

Then you can find it at `/usr/local/sbin/sie-client`

### OpenWrt

Download the OpenWrt SDK which version you want to run, then cd into it

```
./scripts/feeds update -a
./scripts/feeds install -a
```

Clone this package to `package/`

Run `make menuconfig`, check build config, select `sie8021xclient` as `M` at `Network`, then run `make V=s` (This is not a complete step, I assume you have the technical ability to compile OpenWrt :) )

If successful, you can find `sie8021xclient_2.0-testing_<arch>.ipk` at `bin/packages/<arch>/base`

Or you can run `make package/sie8021xclient/compile V=s`

If successful, you can find `sie-client` at `staging_dir/target-<arch>/root-<target>/usr/sbin/`

## Usage

Run `sudo sie-client [account]  [password]  [network card]`

## Auto auth in OpenWrt

Copy `sie_auth` to `/etc/init.d/`, and run `/etc/init.d/sie_auth enable`

Please modify config in `sie_auth` according to your actual info

Don't forget to set IP DNS blblbl in you router

## Fork from

- https://github.com/tengattack/8021xclient-for-windows
- https://github.com/liuqun/njit8021xclient
- https://github.com/bitdust/njit8021xclient

## Depends on

- [libssl](https://wiki.openssl.org/)
- [libpcap](http://www.tcpdump.org/)
