# vagrant-ltp-sandbox
~~~~
>vagrant up vg-ubuntu-01
>vagrant ssh vg-ubuntu-01

vagrant@vg-ubuntu-01:~$ cd /tmp/src/ltp/ltp/testcases/kernel/syscalls/fork/
vagrant@vg-ubuntu-01:/tmp/src/ltp/ltp/testcases/kernel/syscalls/fork$ PATH=$PATH:$PWD ./fork01
fork01      1  TPASS  :  fork() returned 65995
fork01      2  TPASS  :  child pid and fork() return agree: 65995



vagrant@vg-ubuntu-01:~$ cd /opt/ltp/
vagrant@vg-ubuntu-01:/opt/ltp$ sudo ./runltp
~~~~

~~~~
http://linux-test-project.github.io/

~~~~
