@ECHO OFF
echo "Applying script changes to the Hard gamemode of the Equality modpack."

set hard=C:\Users\%USERNAME%\Documents\Curse\Minecraft\Instances\Equality\modpack\Hard\scripts

copy PWC.zs %hard% /Y
copy Hard-*.zs %hard% /Y
copy test.zs %hard% /Y

echo "Done."
exit