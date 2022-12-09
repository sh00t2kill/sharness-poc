#!/bin/bash

test_description="Check DNS resolver"

. ./sharness.sh

DNS_RESOLVER=`resolvectl status | grep "Current DNS Server" | cut -d" " -f4`
DNS_SHOULD_BE="1.1.1.1"


check_match() {
   if [[ "$DNS_RESOLVER" = "$DNS_SHOULD_BE" ]]; then
      echo "match"
      return 0
   else
      echo "no match"
      return 1
   fi
}


#check the things i should be able to hit
test_expect_success "Check if our DNS Resolver is $DNS_SHOULD_BE" "
    test_expect_code 0 check_match
"

test_done
