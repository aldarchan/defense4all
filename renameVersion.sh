

#!/bin/sh

version_from="1\.0\.0"
version_to="1\.0\.1"


grep "$version_from" `find . -name "pom.xml"` | egrep "<version>|<location>|<src>" > /tmp/list
ff_list=`cat /tmp/list | awk -F':' '{print $1}' | uniq`
for ff in $ff_list
do 
    echo $ff
    sed -i -e "s/${version_from}/${version_to}/g" $ff
done

add_on_list="./dfapp.aggregate/src/deb/control/control"
for ff in $add_on_list
do 
    echo $ff
    sed -i -e "s/${version_from}/${version_to}/g" $ff
done

# Just a check

grep "$version_from" `find . -print` | grep -v target > /tmp/list
if [ -s /tmp/list ]
then
    echo "######################################"
    echo "Please check following files:"
    cat /tmp/list
    echo "######################################"
fi





