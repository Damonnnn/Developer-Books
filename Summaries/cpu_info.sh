folder_index=0
if [ ! -f "./folder.ini" ]; then
	touch folder.ini
	echo 0 > folder.ini
else
	folder_index=$(cat folder.ini)
fi

folder_name="cpu_info_${folder_index}"
let folder_index++

echo "${folder_index}" > folder.ini

mkdir ${folder_name}
echo "recording...please stop it manually."
while true
do
	usleep 100000
	for i in $(seq 0 3)
	do
		cat /sys/devices/system/cpu/cpu${i}/cpufreq/cpuinfo_cur_freq >> ${folder_name}/cpu${i}.log
	done
done

while true;do usleep 10000; cat /sys/devices/system/cpu/online >> cpu.log;done