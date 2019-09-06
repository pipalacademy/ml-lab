FROM tensorflow/tensorflow:latest-py3-jupyter
ADD scripts/start-jupyterlab.sh /
CMD ["/start-jupyterlab.sh"]
