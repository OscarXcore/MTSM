@ECHO OFF
echo "Removing all scripts!"

findstr "InstanceRoot" /F:%appdata%\Curse Client\Minecraft.settings > %stuff%
set mcroot=%stuff:~18,58%
cd /d %mcroot%\Equality\modpack\Hard\scripts"

del /Q *.zs

echo "Done."
pause