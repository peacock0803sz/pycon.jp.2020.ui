#!/bin/bash

if [ "${AWS_BRANCH}" = "master" ]; then ENVIRONMENT="production"; fi
if [ "${AWS_BRANCH}" = "staging" ]; then ENVIRONMENT="staging"; fi

PAYLOAD=`cat << EOS
    payload={
        "channel": "${CHANNEL}",
        "text": "<!here> ${ENVIRONMENT}環境のビルドが完了しました",
    }
EOS`

curl -X POST --data-urlencode "$PAYLOAD" $URL
