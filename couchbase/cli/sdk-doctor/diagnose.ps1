param (
    [string]$Password,                      # Password (required)
    [string]$Domain = "127.0.0.1",          # Default domain: localhost    
    [string]$Bucket = "beer-sample",        # Default bucket
    [string]$Username = "Administrator",    # Default username
    [bool]$Clean = $false                   # Cleanup flag

)
$ErrorActionPreference = "Stop"
$cmd = "./sdk-doctor-windows.exe"
if (-not (Test-Path $cmd)){
    Invoke-WebRequest https://github.com/couchbaselabs/sdk-doctor/releases/download/v1.0.8/sdk-doctor-windows.exe -OutFile ./sdk-doctor-windows.exe
}

./sdk-doctor-windows.exe diagnose "couchbase://$Domain/$Bucket" -u $Username -p $Password
if ($Clean) {
    Remove-Item ./sdk-doctor-windows.exe
}

