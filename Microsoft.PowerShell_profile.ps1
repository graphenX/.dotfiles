oh-my-posh init pwsh --config "~\Documents\WindowsPowerShell\Themes\oh-my-posh\themes\atomic.omp.json" | Invoke-Expression

Set-Alias -Name ssha -Value SSH_KEY_ADD

Import-Module -Name Terminal-Icons

function SSH_KEY_ADD() {
    if((Get-Service ssh-agent).Status -eq "Running") {
      ssh-add C:\Users\daniel-farina\.ssh\id_ed25519_graphenX
    }
    else{Write-Output "[*] ssh-agent not running !!"}
}