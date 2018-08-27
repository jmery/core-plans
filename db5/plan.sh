source ../db/plan.sh

pkg_name=db5
pkg_origin=core
pkg_version=5.3.28
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
# Oracle's official download link for Berkeley DB is now behind a login screen
# So using an alternative one
pkg_source="http://anduin.linuxfromscratch.org/BLFS/bdb/db-${pkg_version}.tar.gz"
pkg_shasum="e0a992d740709892e81f9d93f06daf305cf73fb81b545afe72478043172c3628"
pkg_deps=(
  core/glibc
  core/gcc-libs
)
pkg_build_deps=(
  core/coreutils
  core/diffutils
  core/patch
  core/make
  core/gcc7
)

pkg_dirname="db-${pkg_version}"

