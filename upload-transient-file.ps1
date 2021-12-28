# replace the authorization header with your token or integration key
# replace email address in the x-api-user with your sender's email
# make sure you use the correct "shard" (.na2.) with the relevant one for your account
#        See the code to get the correct access point in this repo if you don't know what "shard" your account is on

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/x-www-form-urlencoded")
$headers.Add("x-api-user", "email:sender@yourdomain.com")
$headers.Add("Authorization", "Bearer 3AAABLblqZhD7gPDM****** your access token or integration key here *****5VSYrheIojNCU2WqAsaG1oYtllVLaHv9e")

$multipartContent = [System.Net.Http.MultipartFormDataContent]::new()
$stringHeader = [System.Net.Http.Headers.ContentDispositionHeaderValue]::new("form-data")
$stringHeader.Name = "File-Name"
$stringContent = [System.Net.Http.StringContent]::new("Basic-NDA.pdf")
$stringContent.Headers.ContentDisposition = $stringHeader
$multipartContent.Add($stringContent)

$multipartFile = '/Path/to/your-fle/here/testing/___Public/SendDocs/SendDocs-MSA/_MSA_edited.pdf'
$FileStream = [System.IO.FileStream]::new($multipartFile, [System.IO.FileMode]::Open)
$fileHeader = [System.Net.Http.Headers.ContentDispositionHeaderValue]::new("form-data")
$fileHeader.Name = "File"
$fileHeader.FileName = "_MSA_edited.pdf"
$fileContent = [System.Net.Http.StreamContent]::new($FileStream)
$fileContent.Headers.ContentDisposition = $fileHeader
$multipartContent.Add($fileContent)

$body = $multipartContent

$response = Invoke-RestMethod 'https://api.na2.adobesign.com/api/rest/v6/transientDocuments' -Method 'POST' -Headers $headers -Body $body
$transId = $response.transientDocumentId
$response | ConvertTo-Json
Write-Host $transId
