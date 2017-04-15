#!/bin/bash -e

echo "========================= Clean apt-get ========================"
apt-get clean
mv /var/lib/apt/lists/* /tmp
mkdir -p /var/lib/apt/lists/partial
apt-get clean
apt-get update
echo "======================== Cleaned apt-get ======================"

echo "======================= Installing gcc 6 ======================"
add-apt-repository ppa:ubuntu-toolchain-r/test
apt-get update
apt-get install gcc-6 g++-6
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 50 --slave /usr/bin/g++ g++ /usr/bin/g++-6
update-alternatives --install /usr/bin/gcov gcov /usr/bin/gcov-6 50
gcc --version
echo "================== Successfully Installed gcc 6 ==============="


echo "==================== Installing zephyr dependencies ==================="
apt-get install git make gcc g++ python3-ply python3-yaml python-yaml

wget https://github.com/zephyrproject-rtos/meta-zephyr-sdk/releases/download/0.9/zephyr-sdk-0.9-setup.run
chmod +x zephyr-sdk-0.9-setup.run
./zephyr-sdk-0.9-setup.run --quiet -- -d /opt/sdk/zephyr-sdk-0.9
echo "=============== Successfully Installed zephyr deps ============"
