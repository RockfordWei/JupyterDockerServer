FROM ubuntu:16.04

ENV SRC=/usr/local/src
ENV PYTHONPATH=$SRC/models/research/slim


RUN apt-get update -y && apt-get install -y git wget unzip
RUN cd $SRC && git clone https://github.com/tf-coreml/tf-coreml.git
RUN cd $SRC && git clone https://github.com/cocodataset/cocoapi.git
RUN cd $SRC && git clone https://github.com/tensorflow/models

RUN wget -O $SRC/protobuf.zip https://github.com/google/protobuf/releases/download/v3.6.1/protoc-3.6.1-linux-x86_64.zip
RUN cd /usr && unzip $SRC/protobuf.zip && rm $SRC/protobuf.zip

RUN apt-get install -y python3 python3-pip python3-dev python3-pil python3-lxml python3-tk python3-contextlib2 \
python3-numpy python3-scipy python3-pandas python3-sklearn python3-matplotlib python3-seaborn python-opencv

RUN pip3 install --upgrade pip tensorflowjs jupyter pytesseract tesseract cython

RUN cd $SRC/tf-coreml && python3 setup.py bdist_wheel && pip3 install -e .

RUN cd $SRC/cocoapi/PythonAPI/ && python3 setup.py build_ext --inplace && python3 setup.py build_ext install && cp -r pycocotools $SRC/models/research/

RUN cd $SRC/models/research && protoc object_detection/protos/*.proto --python_out=.
RUN cd $SRC/models/research && python3 setup.py build && python3 setup.py install

RUN pip3 install --upgrade coremltools