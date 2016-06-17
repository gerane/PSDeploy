

InModuleScope 'PSDeploy' {
    $PSVersion = $PSVersionTable.PSVersion.Major
    $ProjectRoot = $ENV:BHProjectPath
    
    $Verbose = @{}
    if($ENV:BHBranchName -notlike "master" -or $env:BHCommitMessage -match "!verbose")
    {
        $Verbose.add("Verbose",$True)
    }

    Describe "FileSystem PS$PSVersion" {
        $null = New-Item -Path "TestDrive:\Files" -ItemType Directory
        $null = New-Item -Path "TestDrive:\Files\TestFolder1" -ItemType Directory
        $null = New-Item -Path "TestDrive:\Files\TestFolder2" -ItemType Directory
        $null = New-Item -Path "TestDrive:\Files\test.txt" -ItemType File
        $null = New-Item -Path "TestDrive:\Files\TestFolder1\test2.txt" -ItemType File
        $null = New-Item -Path "TestDrive:\Files Space" -ItemType Directory
        $null = New-Item -Path "TestDrive:\Files Space\TestFolder1" -ItemType Directory
        $null = New-Item -Path "TestDrive:\Files Space\TestFolder2" -ItemType Directory
        $null = New-Item -Path "TestDrive:\Files Space\test.txt" -ItemType File
        $null = New-Item -Path "TestDrive:\Files Space\TestFolder1\test2.txt" -ItemType File

        Context 'Copies Directory' {
            Invoke-PSDeploy @Verbose -Path "$ProjectRoot\Tests\artifacts\DeploymentsFileSystem.PSDeploy.ps1" -Force -Tags Normal

            It 'Should Copy Directory' {
                $Results = Test-Path -Path 'TestDrive:\Files2'
                $Results | Should Be $True
            }

            It 'Should Copy Sub Directory 1' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestFolder1'
                $Results | Should Be $True
            }

            It 'Should Copy Sub Directory 2' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestFolder2'
                $Results | Should Be $True
            }

            It 'Should Not Copy Fake Sub Directory 3' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestFolder3'
                $Results | Should Be $False
            }

            It 'Should Copy File' {
                $Results = Test-Path -Path 'TestDrive:\Files2\Test.txt'
                $Results | Should Be $True
            }

            It 'Should Copy Nested File' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestFolder1\test2.txt'
                $Results | Should Be $True
            }
        }

        Context 'Copies Directory with Space' {
            Invoke-PSDeploy @Verbose -Path "$ProjectRoot\Tests\artifacts\DeploymentsFileSystem.PSDeploy.ps1" -Force -Tags Space

            It 'Should Copy Directory' {
                $Results = Test-Path -Path 'TestDrive:\Files 2'
                $Results | Should Be $True
            }

            It 'Should Copy Sub Directory 1' {
                $Results = Test-Path -Path 'TestDrive:\Files 2\TestFolder1'
                $Results | Should Be $True
            }

            It 'Should Copy Sub Directory 2' {
                $Results = Test-Path -Path 'TestDrive:\Files 2\TestFolder2'
                $Results | Should Be $True
            }

            It 'Should Not Copy Fake Sub Directory 3' {
                $Results = Test-Path -Path 'TestDrive:\Files 2\TestFolder3'
                $Results | Should Be $False
            }

            It 'Should Copy File' {
                $Results = Test-Path -Path 'TestDrive:\Files 2\Test.txt'
                $Results | Should Be $True
            }

            It 'Should Copy Nested File' {
                $Results = Test-Path -Path 'TestDrive:\Files 2\TestFolder1\test2.txt'
                $Results | Should Be $True
            }
        }

        Context 'Copies Directory with Space and Trailing BackSlash' {
            Invoke-PSDeploy @Verbose -Path "$ProjectRoot\Tests\artifacts\DeploymentsFileSystem.PSDeploy.ps1" -Force -Tags SpaceBackSlash

            It 'Should Copy Directory' {
                $Results = Test-Path -Path 'TestDrive:\Files 2'
                $Results | Should Be $True
            }

            It 'Should Copy Sub Directory 1' {
                $Results = Test-Path -Path 'TestDrive:\Files 2\TestFolder1'
                $Results | Should Be $True
            }

            It 'Should Copy Sub Directory 2' {
                $Results = Test-Path -Path 'TestDrive:\Files 2\TestFolder2'
                $Results | Should Be $True
            }

            It 'Should Not Copy Fake Sub Directory 3' {
                $Results = Test-Path -Path 'TestDrive:\Files 2\TestFolder3'
                $Results | Should Be $False
            }

            It 'Should Copy File' {
                $Results = Test-Path -Path 'TestDrive:\Files 2\Test.txt'
                $Results | Should Be $True
            }

            It 'Should Copy Nested File' {
                $Results = Test-Path -Path 'TestDrive:\Files 2\TestFolder1\test2.txt'
                $Results | Should Be $True
            }
        }

        Context 'Copies Directory Trailing BackSlash' {
            Invoke-PSDeploy @Verbose -Path "$ProjectRoot\Tests\artifacts\DeploymentsFileSystem.PSDeploy.ps1" -Force -Tags BackSlash

            It 'Should Copy Directory' {
                $Results = Test-Path -Path 'TestDrive:\Files2'
                $Results | Should Be $True
            }

            It 'Should Copy Sub Directory 1' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestFolder1'
                $Results | Should Be $True
            }

            It 'Should Copy Sub Directory 2' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestFolder2'
                $Results | Should Be $True
            }

            It 'Should Not Copy Fake Sub Directory 3' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestFolder3'
                $Results | Should Be $False
            }

            It 'Should Copy File' {
                $Results = Test-Path -Path 'TestDrive:\Files2\Test.txt'
                $Results | Should Be $True
            }

            It 'Should Copy Nested File' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestFolder1\test2.txt'
                $Results | Should Be $True
            }
        }

        Context 'Copies Source Directory with Space' {
            Invoke-PSDeploy @Verbose -Path "$ProjectRoot\Tests\artifacts\DeploymentsFileSystem.PSDeploy.ps1" -Force -Tags SourceSpace

            It 'Should Copy Directory' {
                $Results = Test-Path -Path 'TestDrive:\Files2'
                $Results | Should Be $True
            }

            It 'Should Copy Sub Directory 1' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestFolder1'
                $Results | Should Be $True
            }

            It 'Should Copy Sub Directory 2' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestFolder2'
                $Results | Should Be $True
            }

            It 'Should Not Copy Fake Sub Directory 3' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestFolder3'
                $Results | Should Be $False
            }

            It 'Should Copy File' {
                $Results = Test-Path -Path 'TestDrive:\Files2\Test.txt'
                $Results | Should Be $True
            }

            It 'Should Copy Nested File' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestFolder1\test2.txt'
                $Results | Should Be $True
            }
        }

        Context 'Copies Source Directory with Space and Trailing BackSlash' {
            Invoke-PSDeploy @Verbose -Path "$ProjectRoot\Tests\artifacts\DeploymentsFileSystem.PSDeploy.ps1" -Force -Tags SourceSpaceBackSlash

            It 'Should Copy Directory' {
                $Results = Test-Path -Path 'TestDrive:\Files2'
                $Results | Should Be $True
            }

            It 'Should Copy Sub Directory 1' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestFolder1'
                $Results | Should Be $True
            }

            It 'Should Copy Sub Directory 2' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestFolder2'
                $Results | Should Be $True
            }

            It 'Should Not Copy Fake Sub Directory 3' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestFolder3'
                $Results | Should Be $False
            }

            It 'Should Copy File' {
                $Results = Test-Path -Path 'TestDrive:\Files2\Test.txt'
                $Results | Should Be $True
            }

            It 'Should Copy Nested File' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestFolder1\test2.txt'
                $Results | Should Be $True
            }
        }

        Context 'Copies Directory and Removes Additional Files' {
            $null = New-Item -Path "TestDrive:\Files2\TestDeleteDir" -ItemType Directory
            $null = New-Item -Path "TestDrive:\Files2\TestDelete.txt" -ItemType File
            $null = New-Item -Path "TestDrive:\Files2\TestFolder1" -ItemType Directory
            $null = New-Item -Path "TestDrive:\Files2\TestFolder1\TestDelete2.txt" -ItemType File

            Invoke-PSDeploy @Verbose -Path "$ProjectRoot\Tests\artifacts\DeploymentsFileSystem.PSDeploy.ps1" -Force -Tags SourceSpaceBackSlash

            It 'Should Copy Directory' {
                $Results = Test-Path -Path 'TestDrive:\Files2'
                $Results | Should Be $True
            }

            It 'Should Copy Sub Directory 1' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestFolder1'
                $Results | Should Be $True
            }

            It 'Should Copy Sub Directory 2' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestFolder2'
                $Results | Should Be $True
            }

            It 'Should Not Copy Fake Sub Directory 3' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestFolder3'
                $Results | Should Be $False
            }

            It 'Should Copy File' {
                $Results = Test-Path -Path 'TestDrive:\Files2\Test.txt'
                $Results | Should Be $True
            }

            It 'Should Copy Nested File' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestFolder1\test2.txt'
                $Results | Should Be $True
            }

            It 'Should Remove TestDeleteDir Directory' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestDeleteDir'
                $Results | Should Be $False
            }

            It 'Should Remove TestDelete.txt' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestDelete.txt'
                $Results | Should Be $False
            }

            It 'Should Remove TestDelete2.txt' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestFolder1\TestDelete2.txt'
                $Results | Should Be $False
            }            
        }

        Context 'Copies Directory and Leaves Additional Files' {
            $null = New-Item -Path "TestDrive:\Files2\TestDeleteDir" -ItemType Directory
            $null = New-Item -Path "TestDrive:\Files2\TestDelete.txt" -ItemType File
            $null = New-Item -Path "TestDrive:\Files2\TestFolder1" -ItemType Directory
            $null = New-Item -Path "TestDrive:\Files2\TestFolder1\TestDelete2.txt" -ItemType File

            Invoke-PSDeploy @Verbose -Path "$ProjectRoot\Tests\artifacts\DeploymentsFileSystem.PSDeploy.ps1" -Force -Tags MirrorFalse

            It 'Should Copy Directory' {
                $Results = Test-Path -Path 'TestDrive:\Files2'
                $Results | Should Be $True
            }

            It 'Should Copy Sub Directory 1' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestFolder1'
                $Results | Should Be $True
            }

            It 'Should Copy Sub Directory 2' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestFolder2'
                $Results | Should Be $True
            }

            It 'Should Not Copy Fake Sub Directory 3' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestFolder3'
                $Results | Should Be $False
            }

            It 'Should Copy File' {
                $Results = Test-Path -Path 'TestDrive:\Files2\Test.txt'
                $Results | Should Be $True
            }

            It 'Should Copy Nested File' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestFolder1\test2.txt'
                $Results | Should Be $True
            }

            It 'Should Not Remove TestDeleteDir Directory' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestDeleteDir'
                $Results | Should Be $True
            }

            It 'Should Not Remove TestDelete.txt' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestDelete.txt'
                $Results | Should Be $True
            }

            It 'Should Not Remove TestDelete2.txt' {
                $Results = Test-Path -Path 'TestDrive:\Files2\TestFolder1\TestDelete2.txt'
                $Results | Should Be $True
            }            
        }

        Context 'Copies Directory with UNC' {
            Mock Invoke-Robocopy { Return $target }            

            $Results = Invoke-PSDeploy @Verbose -Path "$ProjectRoot\Tests\artifacts\DeploymentsFileSystem.PSDeploy.ps1" -Force -Tags UNC

            It 'Should Call Invoke-Robocopy' {
                Assert-MockCalled Invoke-Robocopy -Times 1 -Exactly
            }

            It 'Should Return Proper UNC Path' {                
                $Results | Should Be '\\contoso.org\share$\Files2'
            }
        }

        Context 'Copies Directory with UNC with Space and BackSlash' {
            Mock Invoke-Robocopy { Return $target }            

            $Results = Invoke-PSDeploy @Verbose -Path "$ProjectRoot\Tests\artifacts\DeploymentsFileSystem.PSDeploy.ps1" -Force -Tags UNCSpaceBackSlash

            It 'Should Call Invoke-Robocopy' {
                Assert-MockCalled Invoke-Robocopy -Times 1 -Exactly
            }

            It 'Should Return Proper UNC Path' {                
                $Results | Should Be '\\contoso.org\share$\Files 2'
            }
        }

        Context 'Copies Directory with UNC with Space' {
            Mock Invoke-Robocopy { Return $target }            

            $Results = Invoke-PSDeploy @Verbose -Path "$ProjectRoot\Tests\artifacts\DeploymentsFileSystem.PSDeploy.ps1" -Force -Tags UNCSpace

            It 'Should Call Invoke-Robocopy' {
                Assert-MockCalled Invoke-Robocopy -Times 1 -Exactly
            }

            It 'Should Return Proper UNC Path' {                
                $Results | Should Be '\\contoso.org\share$\Files 2'
            }
        }

        Context 'Copies Directory with UNC with Space' {
            Mock Invoke-Robocopy { Return $target }            

            $Results = Invoke-PSDeploy @Verbose -Path "$ProjectRoot\Tests\artifacts\DeploymentsFileSystem.PSDeploy.ps1" -Force -Tags UNCBackSlash

            It 'Should Call Invoke-Robocopy' {
                Assert-MockCalled Invoke-Robocopy -Times 1 -Exactly
            }

            It 'Should Return Proper UNC Path' {                
                $Results | Should Be '\\contoso.org\share$\Files 2'
            }
        }
    }
}