# WebUITesting-RobotFramework-Selenium-Python 
This repository contains a test written using robot framework, selenium and, python to verify if youtube video link sharing works as expected.

Prerequisites
Python
Robot Framework
Selenium  
An IDE or Terminal [VSCode]
WebDriver  [Chrome]

# Installation

## Install following packages 

pip install robotframework
pip install robotframework-selenium2library==3.0
pip install --upgrade robotframework-selenium2library

## Install or upgrade chromedriver 
i.e. for mac 
    - brew install chromedriver 
    - brew cask upgrade chromedriver 

## Install following extensions (OPTIONAL)
If you want syntax highlight and IntelliSense in IDE like pycharm or vscode 
- Robot Framework
- Robot Framework Intellisence

# Project Structure

## suites
This folder has `.robot` file which is a test suite containing multiple testcases ideally for the testcases related to the same feature
This folder also has the `report/logs` for the recent test execution  

## scripts 
This folder is for the scripts of the suggested testcases. Out of two suggested testcases listed in here, one is implemented in the `VideoSharingFunctionality.robot` file

## helperKeywords
This file is the python file which contains the helping keywords that can better be defined in a python file than within the robot's file keyword itself.

Prject Configuration
The baseURL is set to "http://localhost:3000" in cypress.json. Make sure port is open to listen.

## logs 
This folder contains the test reports for previous execution. These backup reports are useful to investigate the errors by comparing different reports

# Execute Scripts 
Use the following scripts to run the Docker container:

```
docker build -t qa:test .
docker run -v "$(PWD)/output":/output qa:test
```

# Run inside Docker
docker run --rm --volume "$PWD":/home/robot/tests --volume "$PWD/results":/home/robot/results robotframework/rfdocker:latest VideoSharingFunctionality