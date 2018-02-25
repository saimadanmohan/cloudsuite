#!/bin/bash

VIDEOS_DIR=$1
VIDEO_SET=$2
mkdir -p "$VIDEOS_DIR/logs"

for paramfile in params/*; do
  mkdir /workspace/textpaths
  cp "$paramfile" filegen_param.conf
  ./make_zipf
  python3 ./video_gen.py -p filegen_param.conf -w /workspace -v video_files.txt -s "$VIDEO_SET" -o "$VIDEOS_DIR/"
  cp cl* "$VIDEOS_DIR/logs"
  rm -rf /workspace/*
done
