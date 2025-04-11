$cmd = "C:\\Program Files\couchbase\server\bin\couchbase-cli.exe" # TODO enterprise version bin
$ErrorActionPreference = "Stop"
$Password=$args[1]
function Get-Group{
    # This http API endpoint requires enterprise edition
    $suffix = (& User) -split " "
    & $cmd $suffix --list-groups
}

if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
}