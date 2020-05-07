#!/bin/bash
master_IP="192.168.1.101"
slave_IP="192.168.1.61"

#export PYTHONPATH=$PYTHONPATH:/usr/lib/python2.7/site-packages

for i in {1..20000}
do

        echo "Welcome $i times"

        ./standalone.sh
        wait
	./standalone_data.sh
	wait
        ./standalone_data.sh
        wait
#	./check_sync.sh 0 0 0 0 0 0 1
 #       wait
#	./check_sync.sh 0 0 0 0 0 1 1
#        wait
#	./check_sync.sh 0 0 0 0 0 1 1
#	wait

#        wait
#	./check_sync.sh 0 0 0 0 0 1 1
#        wait
#	./check_sync.sh 0 0 0 0 0 1 1
#        wait
#	./check_sync.sh 0 0 0 0 0 1 1
#	wait
done

