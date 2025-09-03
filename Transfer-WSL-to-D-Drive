# ===============================================
# Move WSL Kali Linux from C:\ to D:\WSL\kali-linux
# ===============================================

# --- CONFIG ---
$WSLRoot    = "D:\WSL"
$KaliTar    = "$WSLRoot\kali-linux.tar"
$KaliTarget = "$WSLRoot\kali-linux"

# Create WSL root folder on D:
New-Item -ItemType Directory -Force -Path $WSLRoot | Out-Null

# Step 1: Export Kali to tar
Write-Host "Exporting Kali Linux to $KaliTar ..."
wsl --export kali-linux $KaliTar

# Step 2: Unregister Kali (removes old C: install)
Write-Host "Unregistering old Kali Linux from C: ..."
wsl --unregister kali-linux

# Step 3: Import Kali to D:
Write-Host "Re-importing Kali Linux to $KaliTarget ..."
wsl --import kali-linux $KaliTarget $KaliTar --version 2

# Step 4: Cleanup tar file
Write-Host "Cleaning up export file..."
Remove-Item $KaliTar

# Step 5: Set Kali as default (optional)
Write-Host "Setting Kali Linux as default WSL distro..."
wsl --set-default kali-linux

Write-Host ">>> Done! Kali Linux is now stored in $KaliTarget"
