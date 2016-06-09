#!/bin/bash

lgsm_version="210516"

local modulename="Install"

info_distro.sh
# Gets the teamspeak server architecture
if [ "${arch}" == "x86_64" ]; then
	ts3arch="amd64"
elif [ "${arch}" == "i386" ]||[ "${arch}" == "i686" ]; then
	ts3arch="x86"
else
	fn_print_failure "${arch} is an unsupported architecture"
	exit 1
fi



echo ""
echo "Installing ${gamename} Server"
echo "================================="
cd "${rootdir}"
echo -e "Downloading Sinusbot...\c"
curl -O https://www.sinusbot.com/pre/sinusbot-0.9.12.2-58b509d.tar.bz2
sleep 1
echo -e "Wird Entpackt...\c"
tar -xjvf sinusbot-0.9.12.2-58b509d.tar.bz2
local status=$?
if [ ${status} -eq 0 ]; then
	echo "OK"
else
	echo "FAIL - Exit status ${status}"
	sleep 1
	cat ".${servicename}-tar-error.tmp"
	rm ".${servicename}-tar-error.tmp"
	exit $?
fi
echo -e "copying to ${filesdir}...\c"
cp -R "${rootdir}/sinusbot/"* "${filesdir}" 2> ".${servicename}-cp-error.tmp"
local status=$?
if [ ${status} -eq 0 ]; then
	echo "OK"
else
	echo "FAIL - Exit status ${status}"
	sleep 1
	cat ".${servicename}-cp-error.tmp"
	rm ".${servicename}-cp-error.tmp"
	exit $?
fi
rm -f "sinusbot-0.9.12.2-58b509d.tar.bz2"
rm -rf "${rootdir}/sinusbot/"
