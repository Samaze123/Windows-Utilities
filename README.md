# Windows-Utilities

A collection of utility scripts to customize Windows features and solve common annoyances.

## 🚀 Overview

This repository contains PowerShell scripts designed to help you manage and customize Windows features that might be difficult to configure through standard settings interfaces.

## 📋 Available Scripts

### Remove Generated Keyboard Layouts (`Remove-Generated-Keyboard-Layouts.ps1`)

**Purpose:** Removes unnecessary keyboard layouts from Windows while preserving your primary layout.

**Use Case:** Perfect for users who have Windows set to English but live in regions with different languages (e.g., France), where Windows automatically adds keyboard layouts that are difficult to remove through settings.

**Current Behavior:** The script removes all keyboard layouts except one (your primary layout).

> ⚠️ **Note:** This script was AI-generated and is provided as-is without modifications.

## 🔧 How to Use the Scripts

1. **Download** the script you need from this repository
2. **Right-click** the script and select "Run with PowerShell"
    - Alternatively, open PowerShell as Administrator and run: `.\Script-Name.ps1`
3. **Follow** any on-screen prompts or instructions

## ⚠️ Important Notes

-   Always **backup your system** or create a restore point before running system modification scripts
-   Some scripts may require **administrator privileges** to function correctly
-   These scripts modify system settings - review the code before executing if you have concerns

## 🔍 Script Details

### Remove Generated Keyboard Layouts - Details

This script:

-   Lists all currently installed keyboard layouts
-   Preserves the primary (first) keyboard layout
-   Removes all additional keyboard layouts
-   Prevents Windows from re-adding unwanted layouts

```powershell
# Preview of script functionality (see actual script for complete code)
# The script identifies and removes extraneous keyboard layouts
```

## 🤝 Contributing

Feel free to contribute your own Windows utility scripts by submitting a pull request!

## 📜 License

This project is available under the [MIT License](LICENSE).
