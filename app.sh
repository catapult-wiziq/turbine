#!/usr/bin/env bash

# Author: Varinder Singh
# Description: This script acts as thin wrapper and can be used to set command line flags
# to JVM or CATALINA

: "${DISCOVERY_SERVICE_HOST:? is not set.Exiting...}"
: "${DISCOVERY_SERVICE_PORT:=8001}"

#CATALINA_OPTS="-Xms64m -Xmx128m"
#CATALINA_OPTS="$CATALINA_OPTS -Xss256k"
#CATALINA_OPTS="$CATALINA_OPTS -XX:ThreadPriorityPolicy=42"
#CATALINA_OPTS="$CATALINA_OPTS -XX:MaxGCPauseMillis=150"

#CATALINA_OPTS="$CATALINA_OPTS -server"
#CATALINA_OPTS="$CATALINA_OPdTS -XX:+DisableExplicitGC"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

JAR_FILE="target/*.jar"

SPRING_CMD_OPTS="--eureka.client.serviceUrl.defaultZone=http://${DISCOVERY_SERVICE_HOST}:${DISCOVERY_SERVICE_PORT}/eureka/"

echo $SPRING_CMD_OPTS

# http://docs.oracle.com/middleware/1213/wls/WLSRN/issues.htm#BCFFDBEB
java -Djava.security.egd=file:/dev/./urandom \
$CATALINA_OPTS -jar $DIR/$JAR_FILE \
$SPRING_CMD_OPTS
