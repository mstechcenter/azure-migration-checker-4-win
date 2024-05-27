$src = ".\xxxxx.vhdx"
$dst = ".\xxxxx.vhd"
$name = "xxxxx-Osdisk-00"
$region = "japaneast"
$rg = "xxxxx"

# Convert a virtual disk to a fixed-capacity VHD
Convert-VHD -Path $src -DestinationPath $dst -VHDType Fixed

# Connect to Azure
Connect-AzAccount
#Set-AzContext - SubscriptionID 'xxxxx'

# Upload a VHD to Azure
$size = (Get-Item $dst).length
$config = New-AzDiskConfig -SkuName 'Standard_LRS' -OsType 'Windows' -UploadSizeInBytes $size -Location $region -CreateOption 'Upload' -HyperVGeneration V1
New-AzDisk -ResourceGroupName $rg -DiskName $name -Disk $config
$sas = Grant-AzDiskAccess -ResourceGroupName $rg -DiskName $name -DurationInSecond 86400 -Access 'Write'
$disk = Get-AzDisk -ResourceGroupName $rg -DiskName $name
./AzCopy copy $dst $sas.AccessSAS --blob-type PageBlob
Revoke-AzDiskAccess -ResourceGroupName $rg -DiskName $name