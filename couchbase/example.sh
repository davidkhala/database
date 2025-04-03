set -e
download() {
    # Customers
    wget https://docs.couchbase.com/server/current/analytics/_attachments/CommerceCustomers.json
    # Orders
    wget https://docs.couchbase.com/server/current/analytics/_attachments/CommerceOrders.json
}
setup() {
    # TODO WIP: https://docs.couchbase.com/server/current/analytics/appendix_4_examples.html#Install
    local cluster=$1 # http://node1:8091
    couchbase-cli bucket-create \
        --cluster $cluster \
        --username Administrator \
        --password password \
        --bucket analytics \
        --bucket-type couchbase \
        --bucket-ramsize 100
    
    couchbase-cli collection-manage \
        --cluster $cluster \
        --username Administrator \
        --password password \
        --bucket analytics \
        --create-scope Commerce

}
$@
