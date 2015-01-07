#!/usr/bin/env bash
# This script was found at https://bugs.launchpad.net/kicad/+bug/1290022
#
# Credits: http://www.freerouting.net/fen/viewtopic.php?f=4&t=255
# (A message written by forum user "foka" on 2014-03-23)
#
# This has been hacked together in a few minutes after reading the post above.
#
# 1. Check prerequisites:
if [ ! -f /usr/share/java/javahelp/jh.jar ] \
   || [ ! -f /usr/share/icedtea-web/netx.jar ]
then sudo yaourt -S javahelp2 icedtea-web
fi
# 2. Compile:
if javac -classpath /usr/share/java/javahelp/jh.jar:/usr/share/icedtea-web/netx.jar \
      `find -type f -name "*.java"`
then jar cfe fr.jar gui.MainApplication \
     `find -type f \( -name "*.class" -o -name "*.properties" \)`
else echo "*** Some .java file was not compiled. See above" 1>&2
     exit 1
fi
# 3. Run:
java -Xmx4g -jar fr.jar
