param (
    [string]$Password,                      # Password (required)
    [string]$Remote = "localhost",          # Domain
    [string]$Bucket = "travel-sample",      # Default bucket
    [string]$Username = "Administrator"    # Default username
    
)
$cmd = "C:\Program Files\couchbase\server\bin\cbexport.exe"

function Bucket {
    param (
        [string]$output
    )
    # TODO to be tested
    $params = @{}
    & $cmd json -c couchbases://$Remote -b $Bucket -o $output @params    
}
if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
}
