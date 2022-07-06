oh-my-posh init pwsh --config "~\Documents\WindowsPowerShell\Themes\oh-my-posh\themes\atomic.omp.json" | Invoke-Expression

Set-Alias -Name ssha -Value SSH_KEY_ADD

Import-Module -Name Terminal-Icons

function ADD_SSH_KEY() {
    if((Get-Service ssh-agent).Status -eq "Running") {
      ssh-add C:\Users\daniel-farina\.ssh\id_ed25519_graphenX
    }
    else{Write-Output "[*] ssh-agent not running !!"}
}
function GET_CONN_IF() {
  Get-NetIPInterface -ConnectionState "Connected"
}

function SET_IP_ADDR() {
  Param(
        [parameter(Mandatory=$true)]
        [String]
        $if,

        [parameter(Mandatory=$true)]
        [String]
        $ip,

        [parameter(Mandatory=$true)]
        [String]
        $msk,

        [parameter(Mandatory=$true)]
        [String]
        $gw
    )

  Set-NetIPInterface -InterfaceIndex $if -Dhcp Disabled
  New-NetIPAddress -InterfaceIndex $if -IPAddress $ip -PrefixLength $mk -DefaultGateway $gw
  Set-DnsClientServerAddress -InterfaceIndex $if -ServerAddresses ("192.168.10.1","8.8.8.8")
}
function ADD_IP_ADDR() {
  Param(
        [parameter(Mandatory=$true)]
        [String]
        $if,

        [parameter(Mandatory=$true)]
        [String]
        $ip,

        [parameter(Mandatory=$true)]
        [String]
        $msk
    )

  New-NetIPAddress -InterfaceIndex $if -IPAddress $ip -PrefixLength $mk
}
