
$cmd = "C:\\Program Files\couchbase\server\bin\couchbase-cli.exe"
$ErrorActionPreference = "Stop"
$Password=$args[1]
function User {
    param (
        [string]$Remote = "localhost",          
        [string]$Bucket = "travel-sample",      
        [string]$Username = "Administrator"    
    )
    echo "user-manage -c $Remote -u $Username -p $Password"
}
function Get-User {
    
    $suffix = (& User) -split " "
    & $cmd $suffix --list
}


function Add-User {
    $name=$args[1]
    $userPassword=$args[2]
    $roles=$args[3] # https://docs.couchbase.com/server/current/cli/cbcli/couchbase-cli-user-manage.html#roles
    
    $suffix = (& User) -split " "
    
    & $cmd $suffix --set --rbac-username $name --rbac-password $userPassword --auth-domain local --roles $roles
}
function Remove-User {
    $name=$args[1]
    $suffix = (& User) -split " "
    & $cmd $suffix --delete --rbac-username $name --auth-domain local
}
function Me {
    $suffix = (& User) -split " "
    & $cmd $suffix --my-roles
}


if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
}
