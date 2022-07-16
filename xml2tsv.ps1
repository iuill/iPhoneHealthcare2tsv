Param(
    [parameter(mandatory=$true)][string]$path
)

$xml = [XML](cat $path -Encoding UTF8)
$nav = $xml.CreateNavigator()

$list = @()
$format = "yyyy/MM/dd HH:mm:ss"
$nav.Select("/HealthData/Record[@type='HKQuantityTypeIdentifierBodyMass']") | %{
    $srcApp = $_.GetAttribute("sourceName", "")
    $val = $_.GetAttribute("value", "")
    $start = ([DateTime]($_.GetAttribute("startDate", ""))).ToString($format)
    $end = ([DateTime]($_.GetAttribute("endDate", ""))).ToString($format)

    $list += "$start`t$end`t$srcApp`t$val"
}

Write-Output "start`tend`tsource app`tvalue"
$list | sort | %{Write-Output $_}
