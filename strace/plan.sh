pkg_name=strace
pkg_origin=core
pkg_version=5.0
pkg_license=("LGPL-2.1-or-later")
pkg_description="strace is a system call tracer for Linux"
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_upstream_url="https://strace.io/"
pkg_source="https://github.com/strace/strace/releases/download/v${pkg_version}/${pkg_name}-${pkg_version}.tar.xz"
pkg_shasum=3b7ad77eb2b81dc6078046a9cc56eed5242b67b63748e7fc28f7c2daf4e647da
pkg_deps=(
  core/glibc
  core/libunwind
)
pkg_bin_dirs=(bin)
pkg_build_deps=(
  core/coreutils
  core/make
  core/gcc
  core/diffutils
)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)

do_check() {
  make check
}
