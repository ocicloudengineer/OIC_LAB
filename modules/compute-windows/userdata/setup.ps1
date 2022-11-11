Write-Output 'Configuring ISCSI for Block Volumes'
Set-Service -Name msiscsi -StartupType Automatic
Start-Service msiscsi
 
Write-Output 'Add drive letter and label to disk'
 
$ipv4='${disk_ipv4}'
$iqn='${disk_iqn}'
$label='${disk_label}'
$letter='${disk_letter}'
 
New-IscsiTargetPortal -TargetPortalAddress $ipv4
Connect-IscsiTarget -NodeAddress $iqn -TargetPortalAddress $ipv4 -IsPersistent $True
 
$NewDiskNumber = 1
 
$diskpart_command = $Null
$diskpart_command = @"
SELECT DISK $NewDiskNumber
ATTRIBUTES DISK CLEAR READONLY
ONLINE DISK
CONVERT MBR
CREATE PARTITION PRIMARY ALIGN=64
ASSIGN LETTER=$letter
"@
$diskpart_command | diskpart
Format-Volume -DriveLetter $letter -FileSystem NTFS -NewFileSystemLabel $label -Confirm:$false
 
Write-Output 'The script completed successfully'
