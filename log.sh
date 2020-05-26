#!/bin/bash
master_IP="192.168.1.101"
slave_IP="192.168.1.61"

pwd
cd ~/adrv9009_fmcomms8_sync_test_bash
pwd
acq_per_run=3

if [ -f "nr_runs.txt" ]; then
    prev_runs=$(cat nr_runs.txt)
    echo "continuing $prev_runs"
else 
    echo "new test"
    prev_runs=1
fi
#export PYTHONPATH=$PYTHONPATH:/usr/lib/python2.7/site-packages
total_runs=$prev_runs
for i in {1..2}
do

	echo "run $((total_runs)) times"
	echo "$(((total_runs)*acq_per_run)) samples"

        ./standalone.sh
        wait
	./jesd_status.sh $(((total_runs)*acq_per_run))
	wait
	./dmesg_status.sh $(((total_runs)*acq_per_run))
	wait
	./standalone_data.sh
	wait
        ./standalone_data.sh
        wait

	total_runs=$((i+prev_runs))
done

echo $total_runs>nr_runs.txt

python3 PDU.py 192.168.0.224 1 delayedReboot
poweroff
