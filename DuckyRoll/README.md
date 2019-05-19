# DuckyRoll

A script that opens [fakeUpdate](http://fakeupdate.net/win10u/) in full screen and plays the Rickroll song, as well as some other small pranks: 

 - Constantly setting the volume to 100% to prevent the user from turning it down
 - Pulsing the brightness from 100% to 0% and viceversa

***

The script also does some things to be as undetectable as possible: 

 - It hides the Powershell window right after opening it so user doesn't suspect anything 

 - It uses an external Powershell script to run the prank, so the ducky can be removed as quickly as possible

 - It runs in the background so the only way to stop it is to kill Powershell through Task Manager, which most people won't know/think of doing

 - It always downloads the latest PowerShell script, so editing that file doesn't require reflashing the ducky