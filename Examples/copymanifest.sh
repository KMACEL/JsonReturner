#! /bin/bash

function COPY(){
	echo "======== Copy To Manifest ========"
        buildTime=$(./jsonreturner -p ./out/target/product/rkpx2/system/media/version.json -n kernelversion)
        cp manifest.xml .repo/manifests/versions/$buildTime.xml
        #cp manifest.xml .repo/manifests/versions/$(date +%Y%m%d.%H%M).xml
        echo "Copy OK"
}

function GIT_PUSH(){
	echo "Git Status"
        cd .repo/manifests
        git status

        echo "Git ADD"
        #git add versions/$buildTime.xml
        echo "Git Commit"
        #git commit -m "$buildTime.xml version commit"
        echo "Git Push"
        #git push orgin default
}

if [ -d .repo/manifests/versions/ ]; then
	echo "Versions Folder Found."
	COPY
	GIT_PUSH
else
	echo "Versions Folder Not Found !"
	echo "======== Create Versions 	Folder ========"
	mkdir .repo/manifests/versions
	COPY
	GIT_PUSH
fi
            
