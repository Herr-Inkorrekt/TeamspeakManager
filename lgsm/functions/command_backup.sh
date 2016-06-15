#!/bin/bash
# LGSM command_backup.sh function
#
#
lgsm_version="210516"

# Description: Creates a .tar.gz file in the backup directory.

local modulename="Backup"
function_selfname="$(basename $(readlink -f "${BASH_SOURCE[0]}"))"

check.sh
backupname="${servicename}-$(date '+%Y-%m-%d-%H%M%S')"
echo ""
fn_print_info_nl "A total of $(du -sh "${rootdir}" --exclude="${backupdir}" | awk '{print $1}') will be compressed into the following backup:"
echo "${backupdir}/${backupname}.tar.gz"
echo ""


echo ""
check_status.sh

fi
fn_scriptlog "Started backup"
fn_print_dots "Backup in progress, please wait..."
sleep 2
if [ ! -d "${backupdir}" ]; then
	mkdir "${backupdir}"
fi
tar -czf "${backupdir}/${backupname}.tar.gz" -C "${rootdir}" --exclude "backups" ./*
fn_print_ok_nl "Backup created: ${backupname}.tar.gz is $(du -sh "${backupdir}/${backupname}.tar.gz" | awk '{print $1}') size"
fn_scriptlog "Complete, Backup created: ${backupdir}/${backupname}.tar.gz is $(du -sh "${backupdir}/${backupname}.tar.gz" | awk '{print $1}') size"
sleep 1
echo ""
