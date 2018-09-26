#!/bin/bash

sudo nvidia-docker run -v /coco/:/packages/detectron/lib/datasets/data/coco -it detectron:cpu /bin/bash

