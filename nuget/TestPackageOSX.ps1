#***************************************
#Arguments
#%1: Version of Release (0.0.0.yyyyMMdd)
#***************************************
Param([Parameter(
      Mandatory=$True,
      Position = 1
      )][string]
      $Version
)

Set-StrictMode -Version Latest

$OperatingSystem="osx"

# Store current directory
$Current = Get-Location

$BuildTargets = @()
$BuildTargets += New-Object PSObject -Property @{Package = "NcnnDotNet";     PlatformTarget="x64"; RID = "$OperatingSystem-x64"; }
$BuildTargets += New-Object PSObject -Property @{Package = "NcnnDotNet.GPU"; PlatformTarget="x64"; RID = "$OperatingSystem-x64"; }

foreach($BuildTarget in $BuildTargets)
{
   $package = $BuildTarget.Package
   $platformTarget = $BuildTarget.PlatformTarget
   $runtimeIdentifier = $BuildTarget.RID
   $command = ".\\TestPackage.ps1 -Package ${package} -Version $Version -PlatformTarget ${platformTarget} -RuntimeIdentifier ${runtimeIdentifier}"
   Invoke-Expression $command

   if ($lastexitcode -ne 0)
   {
      Set-Location -Path $Current
      exit -1
   }
}