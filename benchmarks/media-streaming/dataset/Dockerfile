FROM ubuntu:14.04
MAINTAINER Alexandros Daglis <alexandros.daglis@epfl.ch>

RUN apt-get update -y && \
	apt-get install -y --force-yes software-properties-common && \
	apt-add-repository "ppa:mc3man/trusty-media" && \
	add-apt-repository ppa:deadsnakes/ppa && \
	apt-get update -y && \
	apt-get install -y --no-install-recommends \
	build-essential \
	python3.5 python-dev python-pip \
	ffmpeg \
	&& rm -rf /var/lib/apt/lists/*

COPY files /root/

RUN mkdir /videos
RUN mkdir /workspace
RUN cd /root/filegen && make && ./generate_video_files_and_logs.sh /videos /root/VideoSet
RUN rmdir /workspace
RUN rm -rf /root/VideoSet
VOLUME ["/videos"]
