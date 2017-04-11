#!/bin/sh

echo --- Integration Tests ---

### Variables ###

hostname="docker-host1.shef.ac.uk"
application="Test Alpine Nginx Container $(date +$s)" #randomized

echo Hostname: ${hostname}
echo Application: ${application}

### Tests ###
echo "TEST: GET request should return 'alpine-nginx' in the response body"
url="http://${hostname}:9090"
echo ${url}
curl -X GET -H 'Accept: application/html; charset=UTF-8' \
--url "${url}" \
| grep alpine-nginx > /dev/null
echo "$?"
[ "$?" -ne 0 ] && echo "RESULT: fail" && exit 1
echo "RESULT: pass"
