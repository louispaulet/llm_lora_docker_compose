FROM pytorch/pytorch:2.1.0-cuda12.1-cudnn8-runtime

CMD ["nvidia-smi"]

# Set working directory
WORKDIR /workspace

COPY requirements.txt /workspace

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

RUN pip install jupyter


# Copy local files to the container
COPY ./project/ /workspace/

# Set the default command to execute your notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token=''"]

