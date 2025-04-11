
Describe "User Manage" {
    . ..\admin.ps1
    $name = "sync_gateway"
    $password = "password"
    It "'user-manage' should return a list of users" {
        $result = Get-User $password
        $result | Should Not BeNullOrEmpty
    }
    It "'user-manage' should add a user" {
        $newPassword = "testpassword"
        $roles = "bucket_full_access[*]"
        $result = Add-User $password $name $newPassword $roles
        $result | Should Be "SUCCESS: User $name set"
    }
    It "'user-manage' should add a user" {
        $result = Remove-User $password $name
        $result | Should Be "SUCCESS: User '$name' was removed"
    }
}