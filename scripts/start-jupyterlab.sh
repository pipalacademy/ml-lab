#! /bin/bash

# Use the JUPYTERLAB_TOKEN environment variable as token if specified
if [ "$JUPYTERLAB_TOKEN" != "" ]
then
    ARGS="--NotebookApp.token=$JUPYTERLAB_TOKEN"
fi

jupyter notebook --notebook-dir=/tf --ip 0.0.0.0 --no-browser --allow-root $ARGS
~
