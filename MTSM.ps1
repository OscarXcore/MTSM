Get-Content "$Env:APPDATA\Curse Client\Minecraft.settings" | Where-Object { $_ -like '*InstanceRoot*' } -OutVariable curse1
$curse = $curse1.Substring(19,57)

function packfind
    {
        dir -Directory $curse | ?{ $_.PSisContainer } | Select-Object Name | Out-File $curse\Instances.txt
        $instances = Get-Content $curse\Instances.txt
        $iinstances = 0
        $instances | ForEach-Object { Write-Host ($iinstances++) $_ }

    }




packfind