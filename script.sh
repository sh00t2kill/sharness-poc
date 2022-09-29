#!/bin/bash

test_description="Show basic features of Sharness"

. ./sharness.sh

LOCAL_NETWORK_SUCCESS="192.168.1.1 172.19.87.233"

REMOTE_NETWORK_FAILURE="1.1.1.1 8.8.8.8"


#check the things i should be able to hit
for ip in $LOCAL_NETWORK_SUCCESS; do
  test_expect_success "Check expected successfull connection to $ip" "
     ping -c 2 $ip
  "
done

#check the things i should NOT be able to hit
for ip in $REMOTE_NETWORK_FAILURE; do
  test_expect_failure "Check expected failure connection to $ip" "
     ping -c 2 $ip
  "
done

test_done
