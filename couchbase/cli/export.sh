remote=${url:-"localhost:8091"}
cmd=/opt/couchbase/bin/cbexport
bucket() {
    # TODO WIP
    local bucketname=$1
    shift 1
    local output=$1
    shift 1
    $cmd json -c couchbases://$remote -b $bucketname -o $output $@
}

"$@"
