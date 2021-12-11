Instructions from: https://superuser.com/questions/616780/where-are-windows-7-activation-file-stored 

Save token file from old installation from:

C:\Windows\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform\tokens.dat



        Make a copy of the tokens.dat file from the path listed above
        Make sure you know your Windows 7 product key. If you have lost it, you can find tools to retrieve it from the registry on Google.
        Reinstall Windows 7 and skip the product key entry
        On the new Windows installation, launch the Command Prompt as Administrator
        Run the command slmgr -ipk <your Windows 7 product key> using the previous Windows 7 product key
        Run net stop sppsvc
        Change into the folder where your backup of tokens.dat is and run copy /Y tokens.dat
          %WinDir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform\tokens.dat
        Run net start sppsvc

Windows 7 should now be fully activated using your previous key and activation token.