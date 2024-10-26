

bcp $env:table_name in $env:file -S $env:server_name -d $env:db -U $env:dbuser -P $env:password -q -c -t ","