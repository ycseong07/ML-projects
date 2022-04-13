FROM tensorflow/tensorflow:latest-gpu-py3
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN add-apt-repository ppa:git-core/ppa

RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    build-essential \
    byobu \
    ca-certificates \
    git-core git \
    htop \
    libglib2.0-0 \
    libjpeg-dev \
    libpng-dev \
    libxext6 \
    libsm6 \
    libxrender1 \
    libcupti-dev \
    openssh-server \
    software-properties-common \
    vim \
    && \
apt-get clean && \
rm -rf /var/lib/apt/lists/*

#################### Install Anaconda
# Why Anaconda?  Its recommended Package Manager For PyTorch
# The following section is from https://hub.docker.com/r/continuumio/anaconda3/~/dockerfile/
# You may have to check this periodically and update

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda3-5.3.0-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh

ENV PATH /opt/conda/bin:$PATH
##################

# Install Pytorch Instructions at http://pytorch.org/
RUN conda install -y pytorch torchvision cuda90 -c pytorch

RUN pip install opencv-python
RUN pip install opencv-contrib-python

#RUN conda config --add channels conda-forge && \
#conda install libopencv opencv py-opencv

RUN pip install pip --upgrade
RUN pip install setuptools --upgrade

# Install Python packages
RUN pip --no-cache-dir install --upgrade altair
RUN pip --no-cache-dir install --upgrade annoy
#RUN pip --no-cache-dir install --upgrade bcolz
RUN pip --no-cache-dir install --upgrade dask
RUN pip --no-cache-dir install --upgrade fastai
RUN pip --no-cache-dir install --upgrade gensim
RUN pip --no-cache-dir install --upgrade graphviz
RUN pip --no-cache-dir install --upgrade h5py
RUN pip --no-cache-dir install --upgrade hdfs
RUN pip --no-cache-dir install --upgrade isoweek
RUN pip --no-cache-dir install --upgrade jsonpath_rw_ext
RUN pip --no-cache-dir install --upgrade jupyter_contrib_nbextensions
RUN pip --no-cache-dir install --upgrade jupyterthemes
RUN pip --no-cache-dir install --upgrade tensorflow-gpu
RUN pip --no-cache-dir install --upgrade keras
RUN pip --no-cache-dir install --upgrade ktext
RUN pip --no-cache-dir install --upgrade more_itertools
RUN pip --no-cache-dir install --upgrade nmslib
RUN pip --no-cache-dir install --upgrade pandas_summary
RUN pip --no-cache-dir install --upgrade Pillow
RUN pip --no-cache-dir install --upgrade pyhive
RUN pip --no-cache-dir install --upgrade spacy
RUN pip --no-cache-dir install --upgrade sklearn_pandas
RUN pip --no-cache-dir install --upgrade textacy
RUN pip --no-cache-dir install --upgrade torchtext
RUN pip --no-cache-dir install --upgrade tqdm
RUN pip --no-cache-dir install --upgrade wget

#For Fairseq-py
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64
RUN echo 'export PATH="/opt/conda/bin/:$PATH"' >> ~/.bashrc

# Open Ports for TensorBoard, Jupyter, and SSH
EXPOSE 6006
EXPOSE 7654
EXPOSE 22

#Setup File System
RUN mkdir ds
ENV HOME=/ds
ENV SHELL=/bin/bash
VOLUME /ds
WORKDIR /ds
ADD run_jupyter.sh /ds/run_jupyter.sh
RUN chmod +x /ds/run_jupyter.sh

# Run the shell
CMD [ "/bin/bash" ]