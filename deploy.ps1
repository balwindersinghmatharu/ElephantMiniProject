Write-Output "You will be prompted to enter ID and Password for Azure."
Login-AzAccount
$RGName="AutomtedRG"
$RGLocation="EastUS"
New-AzResourceGroup -Name $RGName -Location $RGLocation -Force
Write-Output "Resource Group created $RGName"
Write-Output "Location for the RG $RGLocation"
New-AzResourceGroupDeployment `
    -Name 'New-SVCPlan' `
    -ResourceGroupName $RGName `
    -TemplateFile '.\webapp_deployment.json'
if($?){
    Write-Output "The Web App has been created. Please wait for couple of mins before checking the URL."
}
else {
    Write-Output "Some error occured. Please check logs for more details."
}
Start-Sleep -Seconds 60
