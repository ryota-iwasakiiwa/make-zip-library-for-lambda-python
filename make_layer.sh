#!/bin/bash -eu

# delete library
rm -rf "$PWD"/layer/library
rm -f "$PWD"/layer/python.zip

# download library
docker run --rm \
          -v "$PWD":/var/task \
          lambci/lambda:build-python3.8 \
          /bin/sh \
          -c "pip install --upgrade -r requirements.txt -t layer/library/python/lib/python3.8/site-packages/; exit"

# zip library
cd layer/library
zip -r ../python.zip ./python/ > /dev/null