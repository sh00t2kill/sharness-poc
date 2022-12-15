#!/bin/bash

test_description="Show basic features of Sharness"

. $SHARNESS_PATH

LOCAL_NETWORK_SUCCESS="192.168.1.1 172.19.87.233"
REMOTE_NETWORK_FAILURE="1.1.1.1 8.8.8.8"
EXPECTED_CIDR="192.168.1.0/24"

#check the things i should be able to hit
for lip in $LOCAL_NETWORK_SUCCESS; do
  test_expect_success "Check expected successfull connection to $lip" "
     ping -c 2 $lip
  "
done

#check the things i should NOT be able to hit
for rip in $REMOTE_NETWORK_FAILURE; do
  test_expect_failure "Check expected failure connection to $rip" "
     ping -c 2 $rip
  "
done

local_ip=$(ip addr show $(ip route | awk '/default/ { print $5 }') | grep "inet" | head -n 1 | awk '/inet/ {print $2}' | cut -d'/' -f1)
test_expect_success "Check my IP $local_ip is in expected range $EXPECTED_CIDR" "
   grepcidr "$EXPECTED_CIDR" <(echo "$local_ip")
"

test_done
