#!/bin/bash

sudo nvidia-docker run -v /home/user/coco/:/packages/detectron/lib/datasets/data/coco -it detectron:gpu /bin/bash

