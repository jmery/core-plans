source ../openssl/plan.sh

pkg_name=openssl-musl
pkg_origin=core
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_description="\
OpenSSL is an open source project that provides a robust, commercial-grade, \
and full-featured toolkit for the Transport Layer Security (TLS) and Secure \
Sockets Layer (SSL) protocols. It is also a general-purpose cryptography \
library.\
"
pkg_upstream_url="https://www.openssl.org"
pkg_license=('OpenSSL')
pkg_deps=(
  core/musl
  core/zlib-musl
  core/cacerts
)

do_prepare() {
  PLAN_CONTEXT="$(abspath "$PLAN_CONTEXT/../openssl")" _common_prepare

  dynamic_linker="$(pkg_path_for musl)/lib/ld-musl-x86_64.so.1"
  LDFLAGS="$LDFLAGS -Wl,--dynamic-linker=$dynamic_linker"

  export BUILD_CC=musl-gcc
  build_line "Setting BUILD_CC=$BUILD_CC"

  export ZLIB
  ZLIB=$(pkg_path_for core/zlib-musl)
  build_line "Setting ZLIB=$ZLIB"
  export ZLIB_LIBPATH
  ZLIB_LIB="${ZLIB}/lib"
  build_line "Setting ZLIB_LIB=$ZLIB_LIB"
  export ZLIB_INCLUDE
  ZLIB_INCLUDE="${ZLIB}/include"
  build_line "Setting ZLIB_INCLUDE=$ZLIB_INCLUDE"
}
