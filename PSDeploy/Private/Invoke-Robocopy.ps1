function Invoke-Robocopy
{
    [cmdletbinding()]
    param
    (
        [Parameter(position = 0)]
        [string]$Source,

        [Parameter(position = 1)]
        [string]$Target,

        [Parameter(position = 2)]
        [string[]]$Arguments
    )

    Process
    {
        Write-Verbose "Invoking ROBOCOPY.exe $Source $Target $Arguments"
        ROBOCOPY.exe $Source $Target @Arguments
    }
}