Add-Type -AssemblyName System.Drawing

$apps = @()
$temp = Join-Path $env:TEMP "GlanceGo"
$temp = Join-Path $temp "links"

if (Test-Path $temp) { Remove-Item $temp -Recurse -Force }
New-Item -ItemType Directory -Path $temp | Out-Null

function New-Link {
  param($name, $target)

  $path = Join-Path $temp ("$name.lnk")
  $shell = New-Object -ComObject WScript.Shell

  $lnk = $shell.CreateShortcut($path)
  $lnk.TargetPath = $target
  $lnk.Save()

  return $path
}

function Get-Icon {
  param($path)

  $ms = New-Object System.IO.MemoryStream
  $icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)

  $bmp = $icon.ToBitmap()
  $bmp.Save($ms, [System.Drawing.Imaging.ImageFormat]::Png)

  $bytes = $ms.ToArray()
  $ms.Dispose()

  $b64 = [Convert]::ToBase64String($bytes)
  $uri = "data:image/png;base64,$b64"

  return $uri
}

Get-StartApps | ForEach-Object {
  $id = $_.AppID
  $name = $_.Name

  $lnkTarget = "shell:AppsFolder\$id"
  $appTarget = "shell:AppsFolder\" + '"' + $id + '"'

  $lnk = New-Link -Name $name -Target $lnkTarget
  $icon = Get-Icon -Path $lnk

  $apps += [PSCustomObject]@{
    name   = $name
    icon   = $icon
    target = $appTarget
  }
}

[Console]::OutputEncoding = [Text.UTF8Encoding]::new($False)
$apps | Sort-Object -Unique -Property name | ConvertTo-Json -Compress -Depth 3
