FROM ubuntu:16.04

RUN apt-get update -y && apt-get install -y python3 python3-pip python3-dev 
RUN pip3 install --upgrade tensorflow pandas matplotlib seaborn sklearn jupyter
