# List of packages to install with winget
$wingetPackages = @(
    "7zip.7zip",
    "Amazon.AWSCLI",
    "Amazon.AWSVPNClient",
    "Axosoft.GitKraken",
    "Bitwarden.Bitwarden",
    "calibre.calibre",
    "CoreyButler.NVMforWindows",
    "Discord.Discord",
    "Docker.DockerDesktop",
    "Elgato.StreamDeck",
    "elvirbrk.notehighlight2016",
    "Fedora.FedoraMediaWriter",
    "Git.Git",
    "GitHub.cli",
    "GitHub.GitLFS",
    "GoLang.Go",
    "Google.GoogleDrive",
    "Google.VPNByGoogleOne",
    "Hashicorp.Packer",
    "Hashicorp.Terraform",
    "Hashicorp.Vagrant",
    "Infracost.Infracost",
    "JanDeDobbeleer.OhMyPosh"
    "Lenovo.DockManager",
    "Lenovo.SystemUpdate",
    "Logitech.LogiBolt",
    "Logitech.OptionsPlus",
    "Logitech.UnifyingSoftware",
    "Microsoft.AzureDataStudio",
    "Microsoft.AzureCLI",
    "Microsoft.Azure.StorageExplorer",
    "Microsoft.Bicep",
    "Microsoft.DevHome",
    "Microsoft.Edge.Dev",
    "Microsoft.VisualStudio.2022.Professional",
    "Microsoft.VisualStudioCode",
    "Microsoft.VisualStudioCode.CLI",
    "Microsoft.WinDbg",
    "Mozilla.Firefox",
    "Neux.OneMark",
    "NordSecurity.NordVPN",
    "OpenVPNTechnologies.OpenVPNConnect",
    "RaspberryPiFoundation.RaspberryPiImager",
    "RedHat.Podman",
    "RedHat.Podman-Desktop",
    "Synology.ChatClient",
    "Synology.DriveClient",
    "tailscale.tailscale",
    "TeamViewer.TeamViewer",
    "Valve.Steam",
    "WireGuard.WireGuard",
    "WiresharkFoundation.Wireshark",
    "XnSoft.XnConvert",
    "Yubico.YubikeyManager",
    "Zoom.Zoom"
)

# List of packages to install with msstore
$msstorePackages = @(
    "9P6RC76MSMMJ", # Amazon Prime Video
    "9WZDNCRD29V9", # Microsoft 365 (Office)
    "9NZCC27PR6N6", # Microsoft Dev Home GitHub Extension
    "9PDJDJS743XF", # Microsoft Family Safety
    "XP89DCGQ3K6VLD", # Microsoft PowerToys
    "9P7BP5VNWKX5", # Microsoft Quick Assist
    "9MSPC6MP8FM4", # Microsoft Whiteboard
    "9NCBCSZSJRSB", # Spotify
    "9NKSQGP7F2NH", # WhatsApp
    "9NBLGGH33N0N", # WiFi Analyzer
    "9MV51B301WFD", # Working Hours
    "9P6JD2ZM0JMC", # Zenkit
    "9PP8M19TT4B0", # Zenkit Projects
    "9P6XRJQQ8SHW" # Zenkit To Do
)

# Loop through the winget list and install each package
foreach ($package in $wingetPackages) {
    Write-Output "Installing $package from winget"
    winget install --name $package --source winget --silent
}

# Loop through the msstore list and install each package
foreach ($package in $msstorePackages) {
    Write-Output "Installing $package from msstore"
    winget install --name $package --source msstore --silent
}
