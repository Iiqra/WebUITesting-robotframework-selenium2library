# WebUITesting-robotframework-selenium2library
This repository contains a test written using robot framework, selenium and, python to verify if youtube video link sharing works as expected.

# Prerequisites
[Python](https://www.python.org/downloads/)  
[Robot Framework](https://robotframework.org/)  
[Selenium](https://robotframework.org/Selenium2Library/Selenium2Library.html)  
An IDE or Terminal [VSCode]  
Chrome and Chrome WebDriver  

# Dependencies & Installation

```sh
$ clone https://github.com/Iiqra/WebUITesting-robotframework-selenium2library.git
```

**Install following dependencies**
```sh
$ pip install robotframework  
$ pip install robotframework-selenium2library==3.0
$ pip3 install clipboard
```

**Install or upgrade chromedriver**  
i.e. for mac    
      ```brew install chromedriver``` 
*OR*
     ```brew cask upgrade chromedriver```
     

## Install following extensions [optional]
If you want syntax highlight and IntelliSense in IDE like pycharm or vscode  
> Robot Framework  
> Robot Framework Intellisence

# Project Structure

## suites
This folder has `.robot` file which is a test suite containing multiple testcases ideally for the testcases related to the same feature
This folder also has the `report/logs` for the recent test execution  

## scripts 
This folder is for the scripts of the suggested testcases. Out of two suggested testcases listed in here, one is implemented in the `VideoSharingFunctionality.robot` file for chrome browser, however; it is parameterized so can the same testcase can be run for other browsers as well  
The test scripts have been written using gherkin style (**Given, When, Then** ) for the high-level test behaviour understanding. Also, the descriptive steps are listed in the `documentation` section of the robot file.  

## helperKeywords.py
This python file contains the helping keywords that can better be defined in a python file than within the robot's file keyword itself.

## logs 
This folder contains the **test reports** for previous execution. These backup reports are useful to investigate the errors by comparing different reports

# Execute Scripts 
Use the following scripts to run the Docker container:  
```sh
  $ robot ./suites/VideoSharingFunctionality.robot 
```
**OR for the logs with --loglevel DEBUG **
``` 
  $robot sh -L debug ./suites/VideoSharingFunctionality.robot 
```

## Dockerfile  
This docker file is to containerize this whole package and run test from within in. However, at the moment the image is not building sucessfully due to some chrome driver installation related errors; `libnss` configuration issues in `Python Docker` etc. 
Therefore, I tried building image using ```ubuntu``` image instead of python image, there were two issues;  
1. It was throwing some errors related to geographical region setting.
2. The building was taking expectedly long (heavier in size too), which I found is not much of a use for such small size project. 

```sh
$ docker build -t qa:test .
$ docker run -v "$(PWD)/output":/output qa:test
```  
## docker
This folder contains the package built using an open-source robotframework image from github [reference link](https://github.com/ppodgorsek/docker-robot-framework).  
```sh
$ cd docker
$ docker build -t qa:test .
$ ./run.sh
```
The image builds sucessfully; however, the testcase was failing unexpectedly b/c it was unable to get the handle of some UI's element when executes within the image. 

# USEFUL git commands 
```sh
$ git rm --cached folder_name -r
$ git rm filename 
$ git checkout -b new_branch
```
