docker run \
    -v "$PWD/reports":/opt/robotframework/reports:Z \
    -v "$PWD/suites":/opt/robotframework/tests:Z \
    qa:test
