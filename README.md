# envoy-arm64-builder

A lightweight build wrapper for [Envoy Proxy](https://www.envoyproxy.io/) targeting ARM64 devices (e.g., Raspberry Pi), with `tcmalloc` disabled to improve stability on embedded Linux systems.

## Features

- Builds a release version of Envoy for ARM64 (`aarch64`)
- Disables `tcmalloc` to prevent memory-related crashes on constrained devices
- Uses Docker and Envoy's official devcontainer for consistency
- Supports local and remote build workflows

---

## 🛠️ Setup

<pre><code>git clone https://github.com/tonalflex/envoy-arm64-builder.git
cd envoy-arm64-builder

# If needed, initialize submodules (uncomment if required)
# git submodule update --init --recursive
</code></pre>

---

## 🚀 Local Build Workflow

This builds Envoy locally using Docker Compose and extracts the final binary from the container.

1. Build the Envoy Dockerfile:

```sh
docker build -t envoy-devcontainer envoy/.devcontainer
```

2. Run Docker-compose to build

```sh
docker-compose up
```

This script will:

1. Use Envoy's `do_ci.sh` script with the `bazel.release.server_only` target.
2. Mount a shared volume to extract the compiled binary from the container.
3. Output the `envoy` binary to `./build/envoy`.

---

## ☁️ Remote Build & Release Workflow

To build and tag a version for others to download:

<pre><code>git tag v0.0.1
git push origin v0.0.1
</code></pre>

You can then set up a CI/CD workflow (e.g., GitHub Actions) to build and attach the resulting ARM64 `envoy` binary to the GitHub release.

---

## 📦 Output

After a successful build, the final `envoy` binary will be available at: `./build/envoy`

Copy it to your Raspberry Pi or other ARM64 device and run it like a regular Envoy binary.

---

## 📝 Notes

- You can modify `build-envoy.sh` to change the Bazel target or build flags.
- For best results on Raspberry Pi, ensure your OS is 64-bit and has sufficient memory and swap.
- If you’re using Alpine or musl-based OS, be cautious—Envoy may require glibc.

---

## 📄 License

See [LICENSE](./LICENSE) for details.
