#!/usr/bin/env bash
function init {
    curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
    apt-get update
    apt-get install -y openjdk-8-jre nodejs
    curl -O https://static.imply.io/release/imply-1.3.0.tar.gz
    tar -xzf imply-1.3.0.tar.gz
    cd imply-1.3.0
    sed -i 's/master.example.com/${masterIp}/g' conf/druid/_common/common.runtime.properties
    sed -i 's/-Xms24g/-Xms4g/g' conf/druid/broker/jvm.config
    sed -i 's/-Xmx24g/-Xmx4g/g' conf/druid/broker/jvm.config
    bin/supervise -c conf/supervise/query.conf
}
init