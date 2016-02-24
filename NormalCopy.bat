@ECHO OFF
echo "Applying script changes to the Normal gamemode of the Equality modpack."

set normal=C:\Users\%USERNAME%\Documents\Curse\Minecraft\Instances\Equality\modpack\Normal\scripts

copy PWC.zs %normal% /Y
copy Normal-*.zs %normal% /Y
copy test.zs %normal% /Y

echo "Done."
exit