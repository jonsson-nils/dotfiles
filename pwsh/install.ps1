brew install jandedobbeleer/oh-my-posh/oh-my-posh
Set-PSRepository PSGallery -InstallationPolicy Trusted
Install-Module posh-git -Scope CurrentUser -Repository PSGallery
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
