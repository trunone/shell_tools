#!/bin/bash
#simplified chinese filename to traditional chinese filename
function main() 
{
    for fileName in *
    do
        echo '   Converting: "'$fileName'"...';
        mv $fileName `echo $fileName | iconv -c -f big5 -t utf8`
    done;
    
    for folderName in `ls -F | grep '/'`
    do
        echo '  Into: "'$folderName'".';
        cd $folderName;
        main;
        cd ..;
    done;
}
cd "$1";
main;
