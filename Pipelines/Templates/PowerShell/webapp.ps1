# Defined the Web Application Name and location  
$WebAppName="samplewebapp89"  
$AppServicePlan="samplewebappplan89"  
$Location="Sweden Central" 
$ResourceGroupName="test-rg" 

# Create a resource group.
#$resourceGroup = New-AzResourceGroup -Name $ResourceGroupName -Location $Location

# Create an App Service plan in Free tier.
New-AzAppServicePlan -Name $AppServicePlan -Location $Location -ResourceGroupName $ResourceGroupName -Tier Free

# Create a web app.
New-AzWebApp -Name $WebAppName -Location $Location -AppServicePlan $AppServicePlan -ResourceGroupName $ResourceGroupName


# Set an admin login and password for your server
$adminSqlLogin = "SqlAdmin"
$password = "Testdb@2023"

# Set server name - the logical server name has to be unique in the system
$serverName = "server-sql-08976"

# The sample database name
$databaseName = "BookStore"

# The ip address range that you want to allow to access your server
$startIp = "0.0.0.0"
$endIp = "0.0.0.0"

# Create a server with a system wide unique server name
$server = New-AzSqlServer -ResourceGroupName $resourceGroupName `
    -ServerName $serverName `
    -Location $location `
    -SqlAdministratorCredentials $(New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $adminSqlLogin, $(ConvertTo-SecureString -String $password -AsPlainText -Force))

# Create a server firewall rule that allows access from the specified IP range
$serverFirewallRule = New-AzSqlServerFirewallRule -ResourceGroupName $resourceGroupName `
    -ServerName $serverName `
    -FirewallRuleName "AllowedIPs" -StartIpAddress $startIp -EndIpAddress $endIp

# Create a blank database with an S0 performance level
$database = New-AzSqlDatabase  -ResourceGroupName $resourceGroupName `
    -ServerName $serverName `
    -DatabaseName $databaseName `
    -RequestedServiceObjectiveName "S0" `
    -SampleName "AdventureWorksLT"


    Server=tcp:server-sql-08976.database.windows.net,1433;Initial Catalog=BookStore;Persist Security Info=False;User ID=SqlAdmin;Password=Testdb@2023;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;