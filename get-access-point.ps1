[Net.ServicePointManager]::SecurityProtocol = 
[Net.SecurityProtocolType]::Tls12

$url = "https://api.echosign.com/api/rest/v6/baseUris"

$header = @{"Authorization" = "Bearer 3AAABLblqZhD7gPD****** your access token or integration key here ******IojNCU2WqAsaG1oYtllVLaHv9e";
"x-api-user"= "email:sender-email@yourdomain.com"}


$Result = Invoke-RestMethod -Uri $url -Method Get -Headers $header

Write-Host $Result.apiAccessPoint 
