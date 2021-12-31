#!/bin/bash

echo "post-start start" >> $HOME/status

# this runs each time the container starts

# it's a great place to pull Docker images so they're always fresh

echo "post-start complete" >> $HOME/status
