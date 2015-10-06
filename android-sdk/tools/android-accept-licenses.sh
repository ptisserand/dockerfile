#!/usr/bin/expect -f

# from: https://github.com/appunite/docker/blob/master/android-java7/tools/android-accept-licenses.sh
set timeout 1800
set cmd [lindex $argv 0]
set licenses [lindex $argv 1]

spawn {*}$cmd
expect {
  "Do you accept the license '*'*" {
        exp_send "y\r"
        exp_continue
  }
  eof
}
