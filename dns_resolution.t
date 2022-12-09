#!/bin/bash

test_description="Check DNS resolution against benchmark"

. ./sharness.sh

DNS_DOMAINS="www.google.com www.google.com.au www.yahoo.com"

#check the things i should be able to hit
for domain in $DNS_DOMAINS; do
  test_expect_success "Check DNS resolution time for $domain" "
     test `dig $domain | grep time | cut -d: -f2 | cut -d" " -f2` -lt 3
  "
done

test_done
