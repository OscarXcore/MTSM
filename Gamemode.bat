@echo off

set file="%appdata%\Curse Client\Minecraft.settings"
for /f "delims=," %%a in ('FINDSTR InstanceRoot %file%') do set dir=%%a
set mcroot=%dir:~18,58%

:packfind
cd /d %mcroot%
setlocal enabledelayedexpansion
for /f "delims=" %%b in ('dir /b /ad *') do echo %%b>> Instance.txt
set SEPARATOR=::
set filecontent=
for /f "delims=" %%d in (Instance.txt) do (
set currentline=%%d
set filecontent=!filecontent!%SEPARATOR%!currentline!
)
echo The current Modpacks available are: %filecontent%
set /P pick=Which Instance do you want to use? 
del Instance.txt

:mods
cd /d %mcroot%\%pick%\mods\"
	if exist FTBTweaks-*.jar (
		::echo hello
		goto :gmdes
	) else if exist MineTweaker3-*.jar (
		cd /d %mcroot%\%pick%\scripts\"
		if not exist %mcroot%\%pick%\scripts\mtsm\" (
			mkdir %mcroot%\%pick%\scripts\mtsm\"
			::echo hello
		)
		goto :mtscripts
	)

:gmdes
cd %mcroot%\%pick%\modpack"
if not exist %mcroot%\%pick%\modpack\mtsm"
mkdir %mcroot%\%pick%\modpack\mtsm"
setlocal enabledelayedexpansion
for /f "delims=" %%b in ('dir /b /a:d *') do echo %%b>> gamemodes.txt
	set SEPARATOR=:
	set SEPARATOR2=:
	set filecontent=
	for /f "delims=" %%d in (gamemodes.txt) do (
		set currentline=%%d
		set filecontent=!filecontent!%SEPARATOR%!currentline!%SEPARATOR2%
	)
		echo The current Gamemodes are: %filecontent%
		del /Q gamemodes.txt
			set /p gmask=Which Gamemode do you want to use? 
			cd /d %mcroot%\%pick%\modpack\mtsm"
			goto :scripts

:scripts
set /P choice=Do you want to clear said gamemode or copy over new scripts?[copy/clear]
	if /I "%choice%" EQU "copy" goto :cpgm
		if /I "%choice%" EQU "clear" goto :clrgm
goto :scripts

:mtscripts
set /P nchoice=Do you want to clear all scripts or copy over new scripts?[copy/clear]
	if /I "%nchoice%" EQU "copy" goto :cpn
		if /I "%nchoice%" EQU "clear" goto :clrn
goto :mtscripts

:cpgm
set /P gmcopy=Copy scripts to multiple gamemodes? or only one gamemode? [multiple/one]
	if /I "%gmcopy%" EQU "multiple" do (
		echo To skip the extra entries press enter.
		set /P multicp=How many gamemodes would you like to copy to?
		setlocal enabledelayedexpansion
			set copyCounter=1
			for /l %%z in (1 1 %multicp%) do (
				set "line!copyCounter!=%%z"
				set /p line!copyCounter!=Please enter gamemode #%%z
				set /a copyCounter+=1
			)
			pause
	)
	if /I "%gmcopy%" EQU "one" do (
		set gmdir=%mcroot%\%pick%\modpack\%gmask%\scripts\"
		copy %gmask%-*.zs /Y
		copy test.zs /Y
		copy Uni-*.zs /Y
	)

:clrgm
set /P gmclear=Clear scripts from multiple gamemodes? or only one gamemode? [multiple/one]
	if /I "%gmclear%" EQU "multiple" do (
		echo 
		set /P multiclr=Which gamemodes would you like to clear?
		echo %multiclr%>> multiclr.txt
			setlocal enabledelayedexpansion
			set Counter=1
			for /f %%z in (multicp.txt) do (
				set "multicp_!Counter!=%%z"
				set /a Counter+=1
			)
	)
	if /I "%gmclear%" EQU "one" do (
		set gmdir=%mcroot%\%pick%\modpack\%gmask%\scripts\"
		copy %gmask%-*.zs /Y
		copy test.zs /Y
		copy Uni-*.zs /Y
	)