FROM python
# set the working directory
WORKDIR /src
# set environment variables used by the python script
ENV INPUT_DIR=/src/input
ENV OUTPUT_DIR=/src/output
# copy the script and requirements file into the container
COPY ./py_script.py ./py_script.py
COPY ./requirements.txt ./requirements.txt
# run the installations specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
# run the script
CMD [ "python", "/src/py_script.py" ]
