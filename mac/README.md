# ML/DL Environment for Applie Silicon (M1) MACs

## prerequisites
- vscode, docker

## How to build env
1. Pull docker image
- docker pull sonoisa/deep-learning-coding:pytorch1.9.0_tensorflow2.6.0

2. Download env template
- git clone arm64-vscode-deep-learning-project-template

3. Install Remote-Containers in vscode extensions

4. Cmd + Shift + p -> select Remote-Containers: Open Folder in Container...

5. Select template folder

6. To use notebook, type 'jupyter lab' in terminal

## Reference pages
- https://qiita.com/sonoisa/items/6d6b4a81169397a96dd8
- https://medium.com/@dexterwilliams04/getting-started-with-python-3-dev-containers-4f14821fec6b
- https://github.com/sonoisa/arm64-vscode-deep-learning-project-template
- https://github.com/sonoisa/arm64-docker-pytorch-tensorflow
