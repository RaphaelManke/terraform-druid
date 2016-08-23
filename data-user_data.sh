#!/usr/bin/env bash
function init {
    curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
    apt-get update
    apt-get install -y openjdk-8-jre nodejs
    curl -O https://static.imply.io/release/imply-1.3.0.tar.gz
    tar -xzf imply-1.3.0.tar.gz
    cd imply-1.3.0
    sed -i 's/master.example.com/${masterIp}/g' conf/druid/_common/common.runtime.properties
    echo "!p95 tranquility-server bin/tranquility server -configFile conf/tranquility/server.json" >> conf/supervise/data.conf
    echo '${data-conf}' > conf/tranquility/server.json
    sed -i 's/#MASTER#/${masterIp}/g' conf/tranquility/server.json
    bin/supervise -c conf/supervise/data.conf
}

init