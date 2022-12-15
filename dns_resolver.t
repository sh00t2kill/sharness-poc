#!/bin/bash

test_description="Check DNS resolver"

. $SHARNESS_PATH

#DNS_RESOLVER=`resolvectl status | grep "Current DNS Server" | cut -d" " -f4`
DNS_RESOLVER=`cat /etc/resolv.conf  | grep nameserver | cut -d" " -f2`
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


#check it using a function and exit codes. Kept for the sake of showing how it works
test_expect_success "Check if our DNS Resolver is $DNS_SHOULD_BE" "
    test_expect_code 0 check_match
"

test_expect_success "Check if our DNS Resolver is $DNS_SHOULD_BE" "
    [ "$DNS_RESOLVER" = "$DNS_SHOULD_BE" ]
"

test_done
