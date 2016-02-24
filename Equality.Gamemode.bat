@ECHO OFF

:scripts
for /f %%i in ("FINDSTR /C:'InstanceRoot' /F:'%appdata%\Curse Client\Minecraft.settings'") do set mcroot=%%i
cd /d %mcroot%\Equality\modpack\common\scripts\
set /P choice=Do you want to clear the current gamemode scripts or copy over new scripts?[cp/clr]?
if /I "%choice%" EQU "cp" goto :cpnew
if /I "%choice%" EQU "clr" goto :clrold
goto :scripts

:cpnew
set /P copy=Which gamemode do you want to copy the scripts to?[cphard/cpnormal/cpinsane/cpall]?
if /I "%copy%" EQU "cphard" goto :cphard
if /I "%copy%" EQU "cpnormal" goto :cpnormal
if /I "%copy%" EQU "cpinsane" goto :cpinsane
if /I "%copy%" EQU "cpall" goto :cpall
goto :cpnew

:cphard
call HardCopy.bat
pause
exit

:cpnormal
call NormalCopy.bat
pause
exit

:cpinsane
call InsaneCopy.bat
pause
exit

:cpall
start /min /wait cmd /k call HardCopy.bat
start /min /wait cmd /k call NormalCopy.bat
start /min /wait cmd /k call InsaneCopy.bat
pause
exit

:clrold
set /P clear=Which gamemode do you want to clear the existing scripts out of?[clrhard/clrnormal/clrinsane/clrall]?
if /I "%clear%" EQU "clrhard" goto :clrhard
if /I "%clear%" EQU "clrnormal" goto :clrnormal
if /I "%clear%" EQU "clrinsane" goto :clrinsane
if /I "%clear%" EQU "clrall" goto :clrall
goto :clrold

:clrhard
call HardClear.bat
pause
exit

:clrnormal
call NormalClear.bat
pause
exit

:clrinsane
call InsaneClear.bat
pause
exit

:clrall
start /min /wait cmd /k HardClear.bat
start /min /wait cmd /k NormalClear.bat
start /min /wait cmd /k InsaneClear.bat
pause
exit