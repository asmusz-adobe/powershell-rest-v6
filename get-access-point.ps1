[Net.ServicePointManager]::SecurityProtocol = 
[Net.SecurityProtocolType]::Tls12

$url = "https://api.echosign.com/api/rest/v6/baseUris"

$header = @{"Authorization" = "Bearer 3AAABLblqZhD7gPDMJ5vjNsKgHXbUxh3eGm3Y2U_iTYlh40xEKV0n3JaoDk3uPhO5VSYrheIojNCU2WqAsaG1oYtllVLaHv9e";
"x-api-user"= "email:echosmusz1+na2main@gmail.com"}

$Result = Invoke-RestMethod -Uri $url -Method Get -Headers $header

$ResultJson = $Result | ConvertTo-Json

Write-Host $ResultJson

Write-Host $Result

Write-Host $Result.apiAccessPoint
