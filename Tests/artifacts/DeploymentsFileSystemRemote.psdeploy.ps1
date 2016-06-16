Deploy {
    By FilesystemRemote Misc {
        FromSource Modules
        To \\contoso.org\share$\PowerShell
        Tagged RelativeUnc
    }

    By FilesystemRemote Files {
        FromSource Modules\File1.ps1,
                   Modules\File2.ps1
        To '\\contoso.org\share$\PowerShell\'
        Tagged CopyItem
    }

    By Filesystem {
        FromSource Modules\CrazyModule
        To '\\contoso.org\share$\PowerShell\Modules\CrazyModule\'
        WithOptions @{
            Mirror = $true
        }
        Tagged UNCBackSlash
    }

    By Filesystem {
        FromSource Modules\CrazyModule
        To '\\contoso.org\share$\PowerShell\Modules\Path Space\CrazyModule\'
        WithOptions @{
            Mirror = $true
        }
        Tagged UNCSpaceBackSlash
    }
}