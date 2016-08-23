#!/usr/bin/env bash
function init {
    curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
    apt-get update
    apt-get install -y openjdk-8-jre nodejs
    curl -O https://static.imply.io/release/imply-1.3.0.tar.gz
    tar -xzf imply-1.3.0.tar.gz
    cd imply-1.3.0
    sed -i 's/master.example.com/localhost/g' conf/druid/_common/common.runtime.properties
    bin/supervise -c conf/supervise/master-with-zk.conf &
}

function installDocker {
    apt-get install -y docker.io
    sudo systemctl start docker
    docker run -d --env "DATA_NODE_IP=${dataIp}"  raphaelmanke/meetup-websocket:stable

}

init
installDocker