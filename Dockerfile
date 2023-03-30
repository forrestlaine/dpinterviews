# syntax=docker/dockerfile:1

#FROM ubuntu:18.04
#RUN apt update
#RUN apt install -y software-properties-common apt-utils
#RUN add-apt-repository ppa:deadsnakes/ppa -y
#RUN apt install -y python3.8 

FROM continuumio/anaconda3:2022.10

WORKDIR process_offsite_audio
COPY process_offsite_audio .
 
RUN /bin/bash -c 'apt-get update; apt-get -y install ffmpeg'
RUN /bin/bash -c 'cd setup; conda env create -f audio_process.yml'

RUN /bin/bash -c 'mkdir -p /PHOENIX/PROTECTED'
RUN /bin/bash -c 'mkdir -p /PHOENIX/GENERAL/docker-study/processed'
RUN /bin/bash -c 'touch /PHOENIX/GENERAL/docker-study/docker-study_metadata.csv'

