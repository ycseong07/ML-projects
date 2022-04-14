FROM tensorflow/tensorflow:latest-gpu-jupyter

RUN pip install --no-cache-dir -U pip setuptools && \
    pip install --no-cache-dir numpy --no-binary :all: && \
    pip install --no-cache-dir opencv-python pandas