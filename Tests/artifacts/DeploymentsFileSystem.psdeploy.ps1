Deploy {
    By Filesystem {
        FromSource 'TestDrive:\Files'
        To 'TestDrive:\Files2'
        Tagged Normal
        WithOptions @{
            Mirror = $true
        }
    }

    By Filesystem {
        FromSource 'TestDrive:\Files'
        To 'TestDrive:\Files 2'
        Tagged Space
        WithOptions @{
            Mirror = $true
        }
    }
    
    By Filesystem {
        FromSource 'TestDrive:\Files'
        To 'TestDrive:\Files 2\'
        Tagged SpaceBackSlash
        WithOptions @{
            Mirror = $true
        }
    }

    By Filesystem {
        FromSource 'TestDrive:\Files\'
        To 'TestDrive:\Files2\'
        Tagged BackSlash
        WithOptions @{
            Mirror = $true
        }
    }

    By Filesystem {
        FromSource 'TestDrive:\Files Space'
        To 'TestDrive:\Files2'
        Tagged SourceSpace
        WithOptions @{
            Mirror = $true
        }
    }

    By Filesystem {
        FromSource 'TestDrive:\Files Space\'
        To 'TestDrive:\Files2'
        Tagged SourceSpaceBackSlash
        WithOptions @{
            Mirror = $true
        }
    }

    By Filesystem {
        FromSource 'TestDrive:\Files'
        To 'TestDrive:\Files2'
        Tagged MirrorFalse
    }
}
