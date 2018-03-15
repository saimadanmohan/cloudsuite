#!/bin/bash
DIR="/videos"
LIBRARY_SIZE=$1

if [ "$(ls -A $DIR)" ]; then
	echo "dataset exists"
    exit
else
	mkdir /workspace
	cd /root/filegen && make && ./generate_video_files_and_logs.sh /videos /root/VideoSet $LIBRARY_SIZE
	cd /
	rmdir /workspace
	rm -rf /root/VideoSet
	rm -rf /root/filegen
fi
