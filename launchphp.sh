#!/bin/bash

# 1. Wait until environment variable is defined
while [ -z "$DOCKERLEMPDB_SERVICE_HOST" ]; do sleep 1; done

# 2. Launch php
service php7.4-fpm start
