

InModuleScope 'PSDeploy' {
    $PSVersion = $PSVersionTable.PSVersion.Major
    $ProjectRoot = $ENV:BHProjectPath
    
    $Verbose = @{}
    if($ENV:BHBranchName -notlike "master" -or $env:BHCommitMessage -match "!verbose")
    {
        $Verbose.add("Verbose",$True)
    }

    Describe "FileSystemRemote PS$PSVersion" {

        Context 'Copy Files Remotely' {
            Mock Invoke-Robocopy { Return $Source }
            Mock Copy-Item {}

            It 'Should call Robocopy' {

            }
        }
    }
}