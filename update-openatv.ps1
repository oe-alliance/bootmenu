Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
function Manipulate-TextFile {
    param(
        [string]$filePath,
        [ref]$countChanged,
        [ref]$unchangedLines
    )
    
    if (Test-Path $filePath -PathType Leaf) {
        $fileContent = Get-Content $filePath
        $modifiedContent = @()
        $changed = $false

        foreach ($line in $fileContent) {
            $modifiedContent += $line

            if ($line -match 'OpenATV_7\.4_E2|"openATV 7\.4 enigma2"|OpenATV_7\.4_enigma2') {
                $modifiedContent += $line -replace '7\.4', '7.6'
                $changed = $true
            }
        }

        if ($changed) {
            $countChanged.Value++
            $modifiedContent | Set-Content $filePath
            Write-Host "Text manipulation completed in $filePath"
        } else {
            $unchangedLines.Value += "`n$filePath :"
            $unchangedLines.Value += $fileContent | Where-Object { $_ -match 'OpenATV_7\.4_E2|"openATV 7\.4 enigma2"|OpenATV_7\.4_enigma2' }
        }
    } else {
        Write-Host "File not found: $filePath"
    }
}

$countChanged = [ref]0
$unchangedLines = [ref]""

$imageFiles = Get-ChildItem -Path "W:\oe-allianz\oe-alliance.core\bootmenu" -Recurse -Filter '*image*' -File

foreach ($file in $imageFiles) {
    Manipulate-TextFile -filePath $file.FullName -countChanged $countChanged -unchangedLines $unchangedLines
}

Write-Host "Total number of modified 'openATV 7.4' lines: $($countChanged.Value)"
Write-Host "Lines not modified:"
Write-Host $unchangedLines.Value
