function RegValue([string]$path,[string]$name) {
    return [String](Get-ItemProperty -Path $path -Name $name | Select -ExpandProperty $name)
}
function ServiceStartType([string]$name) {
    return [String](Get-Service -Name $name | Select -ExpandProperty StartType) 
}
function FilewallProfileEnabled([string]$profile) {
    return [String](Get-NetFirewallProfile -Profile $profile | Select -ExpandProperty Enabled) 
}
function FilewallRuleEnabled([string]$name) {
    return [String](Get-NetFirewallRule -Name $name | Select -ExpandProperty Enabled) 
}
function FileVersion([string]$path) {
    if (Test-Path $path){
        return [Version]((Get-ItemProperty $path).VersionInfo | % {('{0}.{1}.{2}.{3}' -f $_.ProductMajorPart,$_.ProductMinorPart,$_.ProductBuildPart,$_.ProductPrivatePart)})
    }
    else{
        return [Version]'99.9.9999.99999'
    }
}
function HotFixInstalled([string]$id) {
    return [String](Get-HotFix -id $id.Split(',')) 
}

