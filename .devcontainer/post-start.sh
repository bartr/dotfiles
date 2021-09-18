#!/bin/bash

echo "post-start start" >> ~/status

# this runs in background each time the container starts

# it's a great place to pull Docker images so they're always fresh

echo "post-start complete" >> ~/status
