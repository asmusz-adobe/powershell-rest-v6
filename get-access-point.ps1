[Net.ServicePointManager]::SecurityProtocol = 
[Net.SecurityProtocolType]::Tls12

$url = "https://api.echosign.com/api/rest/v6/baseUris"

$header = @{"Authorization" = "Bearer 3AAABLblqZhD7gPDM***** your access token or integration key here *****eIojNCU2WqAsaG1oYtllVLaHv9e";
"x-api-user"= "email:sender.email@yourdomain.com"}

$Result = Invoke-RestMethod -Uri $url -Method Get -Headers $header

$ResultJson = $Result | ConvertTo-Json

Write-Host $ResultJson

Write-Host $Result

Write-Host $Result.apiAccessPoint
