#!/bin/bash

docker build -t quine_img .
docker run -itd --name quine -v $(pwd)/sources:/opt/quine quine_img
docker exec -it quine "/bin/bash"
