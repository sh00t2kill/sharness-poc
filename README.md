# sharness-poc
A PoC for bash script TAP using sharness

This uses the below project for execution. It is not actively maintained, but neither are any of the alternative projects
https://github.com/chriscool/sharness


I put together a VERY simple bash script with some loops and logic to show how shells scripting can be used to make tests easier.

Once installed, simply run network.t from the command line


The biggest take away from this quick experiment was that any looping logic happens outside of the test itself, and you dynamically create the test.

eg:
```
for a in 1,2
  test "test for a"
     check a
```

as opposed to
```
test "the things"
   for a in 1,2
      check a
```
