#!/bin/bash

test_description="Check DNS resolution against benchmark"

. $SHARNESS_PATH

DNS_DOMAINS="www.google.com www.google.com.au www.yahoo.com"
TRIES=3

#check the things i should be able to hit
for domain in $DNS_DOMAINS; do
  counter=0
  while [ $counter -lt $TRIES ]; do
      ((counter++))
      test_expect_success "Attempt $counter: Check DNS resolution time for $domain" "
         test `dig $domain | grep time | cut -d: -f2 | cut -d" " -f2` -lt 3
      "
  done
done

test_done
