
Param(
    [parameter(mandatory=$true)][string]$path
)

$xml = [XML](cat $path -Encoding UTF8)
$nav = $xml.CreateNavigator()


Write-Output "start`tend`tsource app`tvalue"

$list = @()
$format = "yyyy/MM/dd HH:mm:ss"
$nav.Select("/HealthData/Record[@type='HKQuantityTypeIdentifierBodyMass']") | %{
    $srcApp = $_.GetAttribute("sourceName", "")
    $val = $_.GetAttribute("value", "")
    $start = ([DateTime]($_.GetAttribute("startDate", ""))).ToString($format)
    $end = ([DateTime]($_.GetAttribute("endDate", ""))).ToString($format)

    $list += "$start`t$end`t$srcApp`t$val"
}

$list | sort | %{Write-Output $_}