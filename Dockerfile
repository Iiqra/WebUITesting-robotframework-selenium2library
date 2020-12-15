FROM python:3.7

# Copy everything
COPY . .

# Install dependencies
RUN pip3 install robotframework
RUN pip3 install robotframework-selenium2library==3.0
RUN pip3 install chromedriver-py==87.0.4280.20
RUN pip3 install clipboard
RUN apt-get update
RUN apt-get install -y unzip wget libnss3
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install -y ./google-chrome-stable_current_amd64.deb

# RUN python set_to_path.py
ENV PATH=${PATH}:'/usr/local/lib/python3.7/site-packages/chromedriver_py/chromedriver_linux64'
ENV PATH=${PATH}:'/usr/local/lib/python3.7/site-packages/chromedriver_py/'
RUN cp /usr/local/lib/python3.7/site-packages/chromedriver_py/chromedriver_linux64 /usr/local/lib/python3.7/site-packages/chromedriver_py/chromedriver
RUN chromedriver --version

# Set the startup
ENTRYPOINT ["robot", "suites/VideoSharingFunctionality.robot"]
