# DuckyScripts

A collection of Rubber Ducky scripts for the Digispark.
***

## Important Note

Due to the nature of how rubber duckies work (the host device thinks they are USB keyboards), these scripts **will not** work on every single device. This is **not** a problem with the scripts and I can't do anything to change that.

- A script written for Windows uses Windows-specific keyboard shortcuts (such as `Win + R` to launch apps), and therefore will most likely not work on other operating systems.  
In macOS, that same keyboard shortcut is `⌘ + R`, which reloads the current page. 

- Every keyboard layout is different, and each one has the special characters placed in a different position. The `digiKeyboard` library is written for the US layout, meaning that that's the only layout that's guaranteed to work.  
If the ducky is programmed to type `alert(1);`, when that same ducky is inserted into a computer with a Spanish keyboard it'll type in `alert)1=ñ` and `alert)1=ö` on a German keyboard. These commands are clearly not the same, and aren't even valid syntax, meaning that the payload won't even be executed. 


***

## Available Scripts

**If you have an idea for a new script or have a problem with an existing one, please [open an issue](https://github.com/spaceface777/DuckyScripts/issues/new).**

- **[DuckRoll](https://github.com/spaceface777/DuckyScripts/tree/master/DuckRoll)** - A script that opens [fakeUpdate](http://fakeupdate.net/win10u/) in full screen and plays the Rickroll song

- **[Shutdown](https://github.com/spaceface777/DuckyScripts/tree/master/Shutdown)** - A script that shuts down the computer two minutes after plugging in the ducky


***

## Project Structure 
Each folder contains an individual Rubber Ducky script; that means that each folder contains: 
 - A `README.md` file, explaining more in-depth what that individual script does
 - One `.ino` file (the program uploaded to the Arduino)
 - Any dependencies the script has to download 
   - This may be a `Powershell` script, an image, or anything else required for the script to run
