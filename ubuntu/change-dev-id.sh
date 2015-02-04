OLDUID=`id -u dev`
OLDGID=`id -G dev`
usermod -u $1 dev
groupmod -g $2 dev
find / -user ${OLDUID} -exec chown -h $1 {} \;
find / -group ${OLDGID} -exec chgrp -h $2 {} \;
