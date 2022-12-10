FROM python
# set the working directory
WORKDIR /src
# copy the script file into the container
ENV INPUT_DIR=/src/input
ENV OUTPUT_DIR=/src/output
COPY ./input/* ./input/
COPY ./output ./output
COPY ./py_script.py ./py_script.py
COPY ./requirements.txt ./requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

CMD [ "python", "/src/py_script.py" ]