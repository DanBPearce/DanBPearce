$dc = $env:domain # Specify the domain to join.
$pw = $env:dmnpwd | ConvertTo-SecureString -asPlainText –Force # Specify the password for the domain admin.
$usr = $dc + "\" + $env:dmnusr # Specify the domain admin account.
$creds = New-Object System.Management.Automation.PSCredential($usr,$pw)
Add-Computer -DomainName $dc -Credential $creds -restart -force -verbose # Note that the computer will be restarted automatically.
