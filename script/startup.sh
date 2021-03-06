#!/bin/bash

MODE=$1
JAVA_HOME=/usr/java/latest
RFC_HOME=/usr/local/rfc

LIB_PATH=`dirname $0`

CLASSES=$LIB_PATH
CLASSES=$CLASSES:$LIB_PATH/rfc-client.properties
CLASSES=$CLASSES:$LIB_PATH/rfc-server.properties
CLASSES=$CLASSES:$LIB_PATH/rfc-simulator.properties

CLASSES=$CLASSES:$LIB_PATH/lib/commons-lang3-3.3.2.jar
CLASSES=$CLASSES:$LIB_PATH/lib/gson-2.3.1.jar
CLASSES=$CLASSES:$LIB_PATH/lib/jzlib-1.1.3.jar
CLASSES=$CLASSES:$LIB_PATH/lib/log4j-api-2.0.2.jar
CLASSES=$CLASSES:$LIB_PATH/lib/log4j-core-2.0.2.jar
CLASSES=$CLASSES:$LIB_PATH/lib/log4j-jcl-2.0.2.jar
CLASSES=$CLASSES:$LIB_PATH/lib/log4j-slf4j-impl-2.0.2.jar
CLASSES=$CLASSES:$LIB_PATH/lib/netty-all-4.0.25.Final.jar
CLASSES=$CLASSES:$LIB_PATH/lib/slf4j-api-1.7.7.jar
CLASSES=$CLASSES:$LIB_PATH/lib/ychuang-rfc.jar

if [ "$MODE" == "" ] || [ "$MODE" == "b" ] ; then
	echo "Starting up YCHuang RFC in background."	
	nohup $JAVA_HOME/bin/java -Xms1024m -Xms1024m -XX:PermSize=64m -XX:MaxPermSize=64m -cp $CLASSES tw.me.ychuang.rfc.Main > $RFC_HOME/logs/rfc.out 2>&1 &	
else [ "$MODE" == "f" ]
	echo "Starting up YCHuang RFC in foreground."	
	$JAVA_HOME/bin/java -Xms1024m -Xms1024m -XX:PermSize=64m -XX:MaxPermSize=64m -cp $CLASSES tw.me.ychuang.rfc.Main
fi

exit 0
