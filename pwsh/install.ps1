Set-PSRepository PSGallery -InstallationPolicy Trusted
Install-Module posh-git -Scope CurrentUser -Repository PSGallery
Install-Module oh-my-posh -Scope CurrentUser -Repository PSGallery
