$pkg_name="tomcat7"
$pkg_description="An open source implementation of the Java Servlet, JavaServer Pages, Java Expression Language and Java WebSocket technologies."
$pkg_origin="jmery"
$pkg_version="7.0.94"
$pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
$pkg_license=('Apache-2.0')
$pkg_description="The Apache Tomcat software is an open source implementation of the Java Servlet, JavaServer Pages, Java Expression Language and Java WebSocket technologies."
$pkg_upstream_url="http://tomcat.apache.org/"
$pkg_source="http://archive.apache.org/dist/tomcat/tomcat-7/v${pkg_version}/bin/apache-tomcat-${pkg_version}-windows-x64.zip"
$pkg_shasum="5ec44c0aa56be194cc32f5cf52bab4767a6fef6faa05aab2019233c89f0f3aa0"
$pkg_deps=@("core/jre8")
$pkg_exports=@{
  port="server.port"
}
$pkg_exposes=${
  "port"
}

# Tomcat for Windows is precompiled so we override the default build
function Invoke-Build{}

# Default install is to run `make` so we override the default
function Invoke-Install{
    Write-BuildLine "Performing install"
    New-Item -ItemType Directory -Path "${pkg_prefix}/tc"
    Copy-Item -Recurse "$HAB_CACHE_SRC_PATH/$pkg_name-$pkg_version/apache-tomcat-${pkg_version}/*" "${pkg_prefix}/tc"

    # From linux plan; do we need a variation of this for windows?
    # default permissions included in the tarball don't give any world access
    #find "${pkg_prefix}/tc" -type d -exec chmod -v 755 {} +
    #find "${pkg_prefix}/tc" -type f -exec chmod -v 644 {} +
    #find "${pkg_prefix}/tc" -type f -name '*.sh' -exec chmod -v 755 {} +
}