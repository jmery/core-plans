pkg_name=alex
pkg_origin=core
pkg_version=3.2.4
pkg_license=('BSD-3-Clause')
pkg_upstream_url="http://www.haskell.org/alex/"
pkg_description="Alex is a tool for generating lexical analysers in Haskell. It takes a description of tokens based on regular expressions and generates a Haskell module containing code for scanning text efficiently. It is similar to the tool lex or flex for C/C++."
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_source="https://hackage.haskell.org/package/${pkg_name}-${pkg_version}/${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="d58e4d708b14ff332a8a8edad4fa8989cb6a9f518a7c6834e96281ac5f8ff232"

pkg_bin_dirs=(bin)

pkg_deps=(
  core/glibc
  core/gmp
  core/libffi
)

pkg_build_deps=(
  core/cabal-install
  core/ghc
  core/make
  core/which
)

do_clean() {
  do_default_clean

  # Strip any previous cabal config/cache
  rm -rf /root/.cabal
}

do_build() {
  cabal v1-sandbox init
  cabal v1-update

  # Install dependencies
  cabal v1-install --only-dependencies

  # Configure and Build
  cabal v1-configure --prefix="$pkg_prefix"
  cabal v1-build
}

do_check() {
  export PATH="$PWD/dist/build/alex:$PATH"
  cabal v1-test
}

do_install() {
  cabal v1-copy
}
