pkg_name="runc"
pkg_origin="core"
pkg_version=0.1.1
pkg_description="CLI tool for spawning and running containers according to the OCI specification"
pkg_upstream_url="https://www.opencontainers.org/"
pkg_license=('Apache-2.0')
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_source="https://github.com/opencontainers/runc"
pkg_shasum="73549dc3eb29005dae5248385c6b40310a323b817714853d35d7194abfa357b8"
pkg_bin_dirs=(bin)
pkg_scaffolding=core/scaffolding-go
pkg_build_deps=(core/pkg-config core/libseccomp)
