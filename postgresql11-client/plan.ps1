$pkg_name="postgresql11-client"
$pkg_origin="core"
$pkg_version="11.2"
$pkg_license=('PostgreSQL')
$pkg_upstream_url="https://www.postgresql.org/"
$pkg_description="PostgreSQL is a powerful, open source object-relational database system."
$pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
$pkg_source="https://get.enterprisedb.com/postgresql/postgresql-${pkg_version}-1-windows-x64-binaries.zip"
$pkg_shasum="12c361d7a43542e1556f593fe9971463199b73286f5dac6c6bdc83ded45a1ed8"

$pkg_deps=@(
    "core/visual-cpp-redist-2013"
)

$pkg_bin_dirs=@("bin")
$pkg_include_dirs=@("include")
$pkg_lib_dirs=@("lib")

$server_execs=@(
    "ecpg.exe"
    "initdb.exe"
    "pg_archivecleanup.exe"
    "pg_controldata.exe"
    "pg_resetxlog.exe"
    "pg_rewind.exe"
    "pg_test_fsync.exe"
    "pg_test_timing.exe"
    "pg_upgrade.exe"
    "pg_xlogdump.exe"
)

$server_includes=@(
    "informix"
    "server"
)

function Invoke-Install {
    Push-Location "pgsql"

    foreach ($dir in @("bin","include","lib"))
    {
        Copy-Item $dir "$pkg_prefix" -Recurse -Force
    }

    Write-Host "Purging unneeded execs"
    foreach ($unneeded in $server_execs)
    {
        $target = "$pkg_prefix\bin\$unneeded"
        Write-Host "Removing $target"
        Remove-Item -Path $target -Force
    }

    Write-Host "Purging Unneeded includes"
    foreach ($unneeded in $server_includes)
    {
        $target = "$pkg_prefix\include\$unneeded"
        Write-Host "Removing $target"
        Remove-Item -Path $target -Force -Recurse
    }

    Pop-Location
}