#!/bin/bash

function checkDomain()
{
    DOMAIN=$1

    echo Checking $DOMAIN...

    echo | openssl s_client -connect $DOMAIN:443 2>/dev/null | openssl x509 -noout -dates
}

checkDomain $1
