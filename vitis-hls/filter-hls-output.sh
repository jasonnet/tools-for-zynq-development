EXIT_CODE=0

while read readline
do
	if [[ "$readline" == "Error: "* ]] ; then
		echo "$readline"
		EXIT_CODE=1
	elif [[ "$readline" == "ERROR: "* ]] ; then
		echo "$readline"
		EXIT_CODE=1
	elif [[ "$readline" == "FATAL_ERROR: "* ]] ; then
		echo "$readline"
		EXIT_CODE=1
	elif [[ "$readline" == "Failure: "* ]] ; then
		echo "$readline"
		EXIT_CODE=1
  elif [[ "$readline" == "INFO: [HLS 200-"* ]] ; then
    #   These seem to be just informational messages
		# echo "$readline"
		:  # no-op
  elif [[ "$readline" == "make[1]: Entering directory "* ]] ; then
    # Ex.
    #    make[1]: Entering directory 'C:/cygwin64/home/nnd15/work/node/resource_id_indexlet_prj/solution1/csim/build'
		# echo "$readline"
    :  # no-op
  elif [[ "$readline" == "INFO: [HLS 200-1505] Using flow_target "* ]] ; then
    #   This low value sequence is sometimes generated.
    #     INFO: [HLS 200-1505] Using flow_target 'vivado'
    #     Resolution: For help on HLS 200-1505 see www.xilinx.com/cgi-bin/docs/rdoc?v=2020.2;t=hls+guidance;d=200-1505.html
		# echo "$readline"
    :  # no-op
  elif [[ "$readline" == "Compiling ../../"* ]] ; then
    # Ex.
    #    Compiling ../../../../resource_id_indexlet_test.cpp in debug mode
    #    Compiling ../../../../c_resource_id_indexlet.cpp in debug mode
		# echo "$readline"
    :  # no-op
	elif [[ "$readline" == "\$finish called at "* ]] ; then
    if [ $EXIT_CODE = 1 ] ; then
			echo "$readline"
		else
			#echo "readline"    don't show this message if the script intentionally terminates without an error
			:  # no-op
		fi
	else
		echo "$readline"
	fi
done

exit $EXIT_CODE
