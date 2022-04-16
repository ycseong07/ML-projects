## ML/DL Environment for Windows

# prerequisites
- vscode, docker

# How to build env

- docker pull et2010/jupyter-tensorflow-pytorch-gpu
- docker run -it --rm -v {your/local/folder}:/home/jovyan/work -p 8888:8888 et2010/jupyter-tensorflow-pytorch-gpu
