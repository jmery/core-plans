source ../gcc/plan.sh

pkg_name=gcc7
_distname=gcc
pkg_origin=core
pkg_version=7.3.0
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_description="\
The GNU Compiler Collection (GCC) is a compiler system produced by the GNU \
Project supporting various programming languages. GCC is a key component of \
the GNU toolchain and the standard compiler for most Unix-like operating \
systems.\
"
pkg_source="http://ftp.gnu.org/gnu/$_distname/${_distname}-${pkg_version}/${_distname}-${pkg_version}.tar.xz"
pkg_shasum="832ca6ae04636adbb430e865a1451adf6979ab44ca1c8374f61fba65645ce15c"
pkg_dirname="gcc-${pkg_version}"
