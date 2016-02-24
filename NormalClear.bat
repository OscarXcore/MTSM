@ECHO OFF
echo "Removing all scripts!"

chdir C:\Users\%USERNAME%\Documents\Curse\Minecraft\Instances\Equality\modpack\Normal\scripts

del /Q *.zs

echo "Done."
exit