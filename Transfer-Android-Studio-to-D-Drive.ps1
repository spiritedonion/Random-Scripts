# ===== Move Android Studio SDK, AVD, and Gradle =====
# Run this script as Administrator

# --- Paths (edit if you want a different location) ---
$DDriveRoot = "D:\Android"
$NewSDK     = "$DDriveRoot\Sdk"
$NewAVD     = "$DDriveRoot\.android\avd"
$NewGradle  = "$DDriveRoot\.gradle"

# --- Old default paths ---
$OldSDK     = "$env:LOCALAPPDATA\Android\Sdk"
$OldAVD     = "$env:USERPROFILE\.android\avd"
$OldGradle  = "$env:USERPROFILE\.gradle"

# --- Create new folders ---
New-Item -ItemType Directory -Force -Path $NewSDK | Out-Null
New-Item -ItemType Directory -Force -Path $NewAVD | Out-Null
New-Item -ItemType Directory -Force -Path $NewGradle | Out-Null

Write-Host "Moving SDK..."
if (Test-Path $OldSDK) { Move-Item -Force $OldSDK\* $NewSDK }

Write-Host "Moving AVD..."
if (Test-Path $OldAVD) { Move-Item -Force $OldAVD\* $NewAVD }

Write-Host "Moving Gradle cache..."
if (Test-Path $OldGradle) { Move-Item -Force $OldGradle\* $NewGradle }

# --- Set environment variables ---
Write-Host "Updating environment variables..."

[System.Environment]::SetEnvironmentVariable("ANDROID_HOME", $NewSDK, "User")
[System.Environment]::SetEnvironmentVariable("ANDROID_SDK_ROOT", $NewSDK, "User")
[System.Environment]::SetEnvironmentVariable("ANDROID_AVD_HOME", $NewAVD, "User")
[System.Environment]::SetEnvironmentVariable("GRADLE_USER_HOME", $NewGradle, "User")

Write-Host "Done! Please restart your computer for changes to take effect."
