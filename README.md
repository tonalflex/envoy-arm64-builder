# envoy-arm64-builder

A lightweight build wrapper for Envoy Proxy targeting ARM64 (e.g. Raspberry Pi), with tcmalloc disabled to improve stability on embedded Linux devices.

### Build Locally

```sh
./build-envoy.sh
```

### Build Remote

```sh
git tag v0.0.1
git push origin v0.0.1
```
