@ECHO OFF
echo "Applying script changes to the Insane gamemode of the Equality modpack."

set insane=C:\Users\%USERNAME%\Documents\Curse\Minecraft\Instances\Equality\modpack\Insane\scripts

copy PWC.zs %insane% /Y
copy Insane-*.zs %insane% /Y
copy test.zs %insane% /Y

echo "Done."
exit