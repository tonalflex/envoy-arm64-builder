# envoy-arm64-builder

A build wrapper for [Envoy Proxy](https://www.envoyproxy.io/) targeting ARM64 devices (e.g., Raspberry Pi), with `tcmalloc` disabled to improve stability on embedded Linux systems.

## Features

- Builds a release version of Envoy for ARM64 (`aarch64`)
- Disables `tcmalloc` to prevent memory-related crashes on embedded devices
- Uses Docker and Envoy's official devcontainer for consistency

---

## 🛠️ Setup

```sh
git clone https://github.com/tonalflex/envoy-arm64-builder.git
cd envoy-arm64-builder
git submodule update --init --recursive
```

---

## 🚀 Build Envoy

This setup builds Envoy locally using Docker Compose and extracts the final binary from the container.

1. Build the Envoy dev container image:

```sh
docker build -t envoy-devcontainer envoy/.devcontainer
```

2. Run the build using Docker Compose:

```sh
docker-compose up
```

This script will:

1. Use Envoy's `do_ci.sh` script with the `release.server_only` target.
2. Use a shared volume to persist the Bazel cache across runs.
3. Output the compiled Envoy release package (`release.tar.zst`) to the `./bin` directory.
4. Use the `envoy-unpacker` service to automatically decompress and unpack the binaries.

---

## 🛡️ Licensing Notes

This repository is licensed under the [Apache License 2.0](./LICENSE).

It includes [Envoy Proxy](https://www.envoyproxy.io/) as a Git submodule to produce ARM64-compatible release builds. Envoy retains its original [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0); see the upstream [LICENSE](https://github.com/envoyproxy/envoy/blob/main/LICENSE) for details.

If you redistribute binaries built with this project, ensure compliance with Envoy’s license terms.
