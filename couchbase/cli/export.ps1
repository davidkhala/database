$cmd = "C:\Program Files\couchbase\server\bin\cbexport.exe"
$remote = if ($env:remote) { $env:remote } else { "localhost" }
function Bucket {
    param (
        [string]$bucketname,
        [string]$output
    )
    $params = @{}
    & $cmd json -c couchbases://$remote -b $bucketname -o $output @params    
}
if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
}
