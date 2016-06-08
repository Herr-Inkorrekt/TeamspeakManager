#!/bin/bash
lgsm_version="210516"

# Description: Overall function for managing alerts.

fn_alert_test(){
	fn_scriptlog "Sende Test Notfall"
	alertsubject="Teamspeak Manager -Test Notfall - - ${servername}"
	alertbody="Teamspeak Manager, Hast du es gelesen"
}

fn_alert_restart(){
	fn_scriptlog "Sending restart alert: ${executable} process not running"
	alertsubject="Teamspeak Manager -Restart- ${servername}"
	alertbody="${servicename} ${executable} process not running"
}

fn_alert_restart_query(){
	fn_scriptlog "Sending restart alert: ${gsquerycmd}"
	alertsubject="Teamspeak Manager - Restart - ${servername}"
	alertbody="gsquery.py failed to query: ${gsquerycmd}"
}

fn_alert_update(){
	fn_scriptlog "Sende Update Ist da"
	alertsubject="Teamspeak Manager -Update ist vorhanden - ${servername}"
	alertbody="${servicename} recieved update"
}

if [ "${alert}" == "restart" ]; then
	fn_alert_restart
elif [ "${alert}" == "restartquery" ]; then
	fn_alert_restart_query
elif [ "${alert}" == "update" ]; then
	fn_alert_update
elif [ "${alert}" == "test" ]; then
	fn_alert_test
fi

if [ "${emailnotification}" == "on" ]||[ "${emailalert}" == "on" ]&&[ -n "${email}" ]; then
	alert_email.sh
elif [ "${emailnotification}" != "on" ]||[ "${emailalert}" != "on" ]&&[ "${function_selfname}" == "command_test_alert.sh" ]; then
	fn_print_info_nl "Email alerts not enabled"
	fn_scriptlog "Email alerts not enabled"	
elif [ -z "${email}" ]&&[ "${function_selfname}" == "command_test_alert.sh" ]; then
	fn_print_fail_nl "Email no set"
	fn_scriptlog "Email no set"		
fi

if [ "${pushbulletalert}" == "on" ]&&[ -n "${pushbullettoken}" ]; then
	alert_pushbullet.sh
elif [ "${pushbulletalert}" != "on" ]&&[ "${function_selfname}" == "command_test_alert.sh" ]; then
	fn_print_info_nl "Pushbullet alerts not enabled"
	fn_scriptlog "Pushbullet alerts not enabled"
elif [ -z "${pushbullettoken}" ]&&[ "${function_selfname}" == "command_test_alert.sh" ]; then
	fn_print_fail_nl "Pushbullet token not set"
	fn_scriptlog "Pushbullet token not set"
fi