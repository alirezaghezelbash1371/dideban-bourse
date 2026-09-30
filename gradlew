#!/bin/sh
APP_BASE_NAME=`basename "$0"`
APP_HOME=`cd "\`dirname \"$0\"\`" >/dev/null 2>&1 && pwd`

# Download wrapper jar if not present
WRAPPER_JAR="$APP_HOME/gradle/wrapper/gradle-wrapper.jar"
if [ ! -f "$WRAPPER_JAR" ]; then
    echo "Downloading gradle-wrapper.jar..."
    mkdir -p "$APP_HOME/gradle/wrapper"
    curl -sLo "$WRAPPER_JAR" https://raw.githubusercontent.com/gradle/gradle/v8.7.0/gradle/wrapper/gradle-wrapper.jar
fi

CLASSPATH=$WRAPPER_JAR

# Determine the Java command to use to start the JVM.
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        JAVACMD="$JAVA_HOME/jre/sh/java"
    else
        JAVACMD="$JAVA_HOME/bin/java"
    fi
else
    JAVACMD="java"
fi

exec "$JAVACMD" -jar "$WRAPPER_JAR" "$@"
