<#
    .DESCRIPTION
    Runs a docker build for the DataStax Studio version specified in the STUDIO_VERSION file.
#>

$scriptPath = Split-Path -parent $PSCommandPath

# Use contents of STUDIO_VERSION file as variables
Get-Content "$scriptPath\STUDIO_VERSION" |% {
    if ($_) {
        $varParts = $_.Split('=')
        New-Variable -Name $varParts[0] -Value $varParts[1]
    }
}

docker build --build-arg STUDIO_VERSION=$STUDIO_VERSION -t luketillman/datastax-studio:$STUDIO_VERSION .