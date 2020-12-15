# reference URL => https://github.com/ppodgorsek/docker-robot-framework
docker run \
    -v "$PWD/reports":/opt/robotframework/reports:Z \
    -v "$PWD/suites":/opt/robotframework/tests:Z \
    qa:test
