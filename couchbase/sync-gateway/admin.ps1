$config = "C:\Program Files\Couchbase\Sync Gateway\examples\serviceconfig.json"

$cmd = "C:\Program Files\Couchbase\Sync Gateway\sync_gateway.exe"

function Status{
    & $cmd
}
function Configure{
    
    code $config
}
if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
}