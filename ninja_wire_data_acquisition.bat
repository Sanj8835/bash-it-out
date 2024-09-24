@echo off
:: Create a folder for logs if it doesn't exist
set logdir=%USERPROFILE%\ninja_wire_logs
if not exist %logdir% mkdir %logdir%

:: Log timestamp
echo Starting data acquisition at %date% %time% >> %logdir%\data_acquisition_log.txt

:: Collect system information
echo === SYSTEM INFO === >> %logdir%\data_acquisition_log.txt
systeminfo >> %logdir%\data_acquisition_log.txt

:: List running processes
echo === RUNNING PROCESSES === >> %logdir%\data_acquisition_log.txt
tasklist >> %logdir%\data_acquisition_log.txt

:: Network configuration
echo === NETWORK CONFIGURATION === >> %logdir%\data_acquisition_log.txt
ipconfig /all >> %logdir%\data_acquisition_log.txt

:: Active network connections
echo === ACTIVE NETWORK CONNECTIONS === >> %logdir%\data_acquisition_log.txt
netstat -an >> %logdir%\data_acquisition_log.txt

:: List of open files (requires administrative privileges)
echo === OPEN FILES === >> %logdir%\data_acquisition_log.txt
openfiles /query >> %logdir%\data_acquisition_log.txt

:: Collect DNS cache (to see visited domains)
echo === DNS CACHE === >> %logdir%\data_acquisition_log.txt
ipconfig /displaydns >> %logdir%\data_acquisition_log.txt

:: List scheduled tasks
echo === SCHEDULED TASKS === >> %logdir%\data_acquisition_log.txt
schtasks >> %logdir%\data_acquisition_log.txt

:: Save environment variables
echo === ENVIRONMENT VARIABLES === >> %logdir%\data_acquisition_log.txt
set >> %logdir%\data_acquisition_log.txt

:: Log completion time
echo Data acquisition completed at %date% %time% >> %logdir%\data_acquisition_log.txt

:: Exit silently
exit
