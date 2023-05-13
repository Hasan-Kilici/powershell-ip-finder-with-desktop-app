Add-Type -AssemblyName System.Windows.Forms
$form = New-Object System.Windows.Forms.Form
$form.Text = "IP Finder"
$form.ClientSize = New-Object System.Drawing.Size(600, 600)

$Header = New-Object System.Windows.Forms.Label
$Header.Location = New-Object System.Drawing.Point(10, 10)
$Header.Size = New-Object System.Drawing.Size(600, 30)
$Header.Font = New-Object System.Drawing.Font("Arial", 16, [System.Drawing.FontStyle]::Bold)
$Header.Text = "Welcome to IP finder"

$Description = New-Object System.Windows.Forms.Label
$Description.Location = New-Object System.Drawing.Point(10,50)
$Description.Size = New-Object System.Drawing.Size(600, 30)
$Description.Text = "U can Get A Websites DNS Address And Get a IP Location"

$IPHeader = New-Object System.Windows.Forms.Label
$IPHeader.Location = New-Object System.Drawing.Point(10, 80)
$IPHeader.Size = New-Object System.Drawing.Size(300, 30)
$IPHeader.Font = New-Object System.Drawing.Font("Arial", 10, [System.Drawing.FontStyle]::Bold)
$IPHeader.Text = "Get IP with Website URL"

$IPInput = New-Object System.Windows.Forms.TextBox
$IPInput.Location = New-Object System.Drawing.Point(10, 110)
$IPInput.Size = New-Object System.Drawing.Size(200, 20)

$IPResult = New-Object System.Windows.Forms.Button
$IPResult.Location = New-Object System.Drawing.Point(10, 135)
$IPResult.Size = New-Object System.Drawing.Size(100, 30)
$IPResult.Text = "Submit"

$IPResult.Add_Click({
    $domain = $IPInput.Text
    $ipAddress = (Resolve-DnsName -Name $domain -Type A).IPAddress
    [System.Windows.Forms.MessageBox]::Show($ipAddress)
})

$LocationHeader = New-Object System.Windows.Forms.Label
$LocationHeader.Location = New-Object System.Drawing.Point(350, 80)
$LocationHeader.Size = New-Object System.Drawing.Size(350, 30)
$LocationHeader.Font = New-Object System.Drawing.Font("Arial", 10, [System.Drawing.FontStyle]::Bold)
$LocationHeader.Text = "Get Location With IP Address"

$LocationInput = New-Object System.Windows.Forms.TextBox
$LocationInput.Location = New-Object System.Drawing.Point(350, 110)
$LocationInput.Size = New-Object System.Drawing.Size(200, 20)

$LocationResult = New-Object System.Windows.Forms.Button
$LocationResult.Location = New-Object System.Drawing.Point(350, 135)
$LocationResult.Size = New-Object System.Drawing.Size(100, 30)
$LocationResult.Text = "Submit"

$LocationResult.Add_Click({
    $IP = $LocationInput.Text
    $LocationContent = (Invoke-WebRequest "http://ip-api.com/json/$IP").Content
    [System.Windows.Forms.MessageBox]::Show($LocationContent)
})

$form.Controls.Add($Header)
$form.Controls.Add($Description)

$form.Controls.Add($IPHeader)
$form.Controls.Add($IPInput)
$form.Controls.Add($IPResult)

$form.Controls.Add($LocationHeader)
$form.Controls.Add($LocationInput)
$form.Controls.Add($LocationResult)

$form.ShowDialog() | Out-Null
