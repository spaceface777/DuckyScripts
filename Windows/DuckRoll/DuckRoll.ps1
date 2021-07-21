# Delay
Start-Sleep 30

# Imports
Add-Type -AssemblyName presentationCore

# Audio Manager (Modified from https://stackoverflow.com/a/31751275)
Add-Type -TypeDefinition @'
using System.Runtime.InteropServices;

[Guid("5CDF2C82-841E-4546-9722-0CF74078229A"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
interface IAudioEndpointVolume {
    int f(); int g(); int h(); int i();
    int SetMasterVolumeLevelScalar(float fLevel, System.Guid pguidEventContext);
    int j();
    int GetMasterVolumeLevelScalar(out float pfLevel);
    int k(); int l(); int m(); int n();
    int SetMute([MarshalAs(UnmanagedType.Bool)] bool bMute, System.Guid pguidEventContext);
    int GetMute(out bool pbMute);
}
[Guid("D666063F-1587-4E43-81F1-B948E807363F"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
interface IMMDevice {
    int Activate(ref System.Guid id, int clsCtx, int activationParams, out IAudioEndpointVolume aev);
}
[Guid("A95664D2-9614-4F35-A746-DE8DB63617E6"), InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
interface IMMDeviceEnumerator {
    int f(); // Unused
    int GetDefaultAudioEndpoint(int dataFlow, int role, out IMMDevice endpoint);
}
[ComImport, Guid("BCDE0395-E52F-467C-8E3D-C4579291692E")] class MMDeviceEnumeratorComObject { }

public class Audio {
    static IAudioEndpointVolume Vol() {
        var enumerator = new MMDeviceEnumeratorComObject() as IMMDeviceEnumerator;
        IMMDevice dev = null;
        Marshal.ThrowExceptionForHR(enumerator.GetDefaultAudioEndpoint(/*eRender*/ 0, /*eMultimedia*/ 1, out dev));
        IAudioEndpointVolume epv = null;
        var epvid = typeof(IAudioEndpointVolume).GUID;
        Marshal.ThrowExceptionForHR(dev.Activate(ref epvid, /*CLSCTX_ALL*/ 23, 0, out epv));
        return epv;
    }
    public static float Volume {
        get { float v = -1; Marshal.ThrowExceptionForHR(Vol().GetMasterVolumeLevelScalar(out v)); return v * 100; }
        set { Marshal.ThrowExceptionForHR(Vol().SetMasterVolumeLevelScalar(value / 100, System.Guid.Empty)); }
    }
    public static bool Mute {
        get { bool mute; Marshal.ThrowExceptionForHR(Vol().GetMute(out mute)); return mute; }
        set { Marshal.ThrowExceptionForHR(Vol().SetMute(value, System.Guid.Empty)); }
    }
}
'@

# Download Rickroll audio file
Invoke-WebRequest -outf "$Env:appdata\\rick.mp3" "https://raw.githubusercontent.com/spaceface777/DuckyScripts/master/Windows/DuckRoll/DuckRoll.mp3"

# Load the music file
$mediaPlayer = New-Object system.windows.media.mediaplayer
$mediaPlayer.open("$Env:appdata\\rick.mp3")

# Open fakeUpdate 
Start-Process "http://fakeupdate.net/win10ue"
Start-Sleep 1

# Send F11 keypress (Fullscreen)
[void][System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')
[System.Windows.Forms.SendKeys]::SendWait("{F11}")

# Brightness manager
$brightness = Get-WmiObject -Namespace root/WMI -Class WmiMonitorBrightnessMethods

# Unmute and set volume to max.
[Audio]::Mute = $false
[Audio]::Volume = 100

# Play file infinitely
while ($true) {
    $mediaPlayer.Play()

    $TimeEnd = (Get-Date).AddSeconds(207) # The length of the song

    Do { 
        $TimeNow = Get-Date

        # Unmute and set volume to max every second to prevent people from lowering it. 
        [Audio]::Mute = $false
        [Audio]::Volume = 100

        # Pulse brightness
        $brightness.WmiSetBrightness(1, 100)
        Start-Sleep -m 333
        $brightness.WmiSetBrightness(1, 0)
        Start-Sleep -m 333

        # If you want to do more stuff, add it here.

    } Until ($TimeNow -ge $TimeEnd)
    
    $mediaPlayer.Stop()
}
