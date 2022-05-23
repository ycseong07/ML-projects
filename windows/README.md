## ML/DL Environment for Windows

# prerequisites
- vscode, docker

# How to run env

- docker run -d -p 8080:8080 --name "ml-test" -v "${PWD}:/workspace" --env AUTHENTICATE_VIA_JUPYTER="yourToken" --shm-size 512m --restart always --gpus all mltooling/ml-workspace-gpu

# Ref
- https://github.com/ml-tooling/ml-workspace
