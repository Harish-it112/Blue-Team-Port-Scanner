write-host "==========DNS Reachability & Port connectivity test============"
write-host "||
||
||"
#$Ip = @("10.75.6.20", "10.75.6.21")
#Get user Input
$Ip = Read-Host "Please enter IP to check reachability & Port connectivity"
#Resolve IP to NameHost
$dnscheck = Resolve-DnsName $Ip  -ErrorAction SilentlyContinue
Write-Host "Hostname: $($dnscheck.NameHost)"
#Store list of tcp/udp ports
$Port = @(443, 8834, 80, 445, 25, 587, 21, 20, 389, 636, 52, 3268, 3269, 67, 68, 161, 1433, 1521, 23)
#$Port = @(443, 80, 445, 25, 587, 21, 389, 636, 53, 3268, 3269, 1521)
#Ping test
Test-connection $Ip -count 4
#Check Port connectivity
foreach ($Ports in $Port)
{
    $result = Test-NetConnection -ComputerName $Ip -Port $Ports -WarningAction SilentlyContinue

if($result.TcpTestSucceeded)
{
    Write-Host "$Ports connection is True"
}
else 
{
    Write-Host "$Ports connection is Fail"
}
}
Write-Host "||
||
||"
Write-Host "======Scanning Completed======"