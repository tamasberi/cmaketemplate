#!/bin/bash
docker run -it --rm --entrypoint sh -v $(pwd):/work -w /work cmaketemplate:builder -c "mkdir -p /work/build && cd /work/build && cmake .. && make"
