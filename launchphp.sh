#!/bin/bash
# 0. Print present value
OUTPUT=/tmp/value
date > $OUTPUT
echo $DOCKERLEMPDB_SERVICE_HOST >> $OUTPUT
# 1. Wait until environment variable is defined
while [ -z "$DOCKERLEMPDB_SERVICE_HOST" ]; do sleep 1; done
echo $DOCKERLEMPDB_SERVICE_HOST >> $OUTPUT
date >> $OUTPUT

# 2. Launch php
service php7.4-fpm start
