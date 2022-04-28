<#Determine machine type and store in variable#>
function Get-HardwareType{
    
    $hardwaretype = Get-WmiObject -Class Win32_ComputerSystem -Property PCSystemType
        If ($hardwaretype -ne 2)
        {
        return $true
        }
        Else
        {
        return $false
        }}

If (Get-HardwareType)
    {
    <# PC IS A DEKSTOP#>
    $pctype = "D"
    }
    Else
    {
    <# PC IS A LAPTOP#>
    $pctype = "L"
    }

<#Determine last 6 digits for serial number#>
$SerNum = Get-WmiObject win32_bios | select-object -expand Serialnumber

$SerNum = $SerNum -replace '\s',''
$length = $SerNum.length

<#Create new name#>
$newname = $env:Site + $env:Directorate + "-" + $SerNum.SubString($length -6) + $pctype

<#Deploy New Name#>
Rename-Computer -NewName $newname -Force

<#Restart#>
Restart-Computer
