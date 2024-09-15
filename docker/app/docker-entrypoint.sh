#!/bin/bash

service ssh start

rm tmp/pids/server.pid
bundle install --without development test
rails s -b 0.0.0.0
