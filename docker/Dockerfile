FROM tensorflow/tensorflow:latest-py3-jupyter
ADD . /app 
RUN pip install -r /app/requirements.txt
RUN /app/post-install.sh
CMD ["/app/start-jupyterlab.sh"]
