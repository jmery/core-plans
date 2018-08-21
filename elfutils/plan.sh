pkg_name=elfutils
pkg_origin=core
pkg_version=0.173
pkg_license=('GPL-3.0')
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_description="elfutils is a collection of various binary tools such as
  eu-objdump, eu-readelf, and other utilities that allow you to inspect and
  manipulate ELF files."
pkg_upstream_url=https://sourceware.org/elfutils/
pkg_source=https://sourceware.org/${pkg_name}/ftp/${pkg_version}/$pkg_name-$pkg_version.tar.bz2
pkg_shasum=b76d8c133f68dad46250f5c223482c8299d454a69430d9aa5c19123345a000ff
pkg_deps=(
  core/glibc
  core/zlib
)
pkg_build_deps=(
  core/gcc
  core/glibc
  core/m4
  core/make
  core/zlib
)
pkg_bin_dirs=(bin)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)

do_build() {
  build_line "=========="
  build_line "one"
  do_default_build
  build_line "=========="
  build_line "two"
}
