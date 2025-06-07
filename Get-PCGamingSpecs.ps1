# Get-PCGamingSpecs.ps1 - Auto-save version

# Generate filename with timestamp
$timestamp = Get-Date -Format "yyyyMMdd-HHmm"
$outputFile = "PCSpecs-$timestamp.txt"

# Function to write to console and file
function Write-Log {
    param (
        [string]$message
    )
    Write-Output $message
    $message | Out-File -FilePath $outputFile -Append -Encoding utf8
}

# Start of log
Write-Log "============================================="
Write-Log "PC Gaming Specs Report - $timestamp"
Write-Log "============================================="
Write-Log ""

# System Info
Write-Log "=== System Information ==="
Get-ComputerInfo | Select-Object OSName, OSArchitecture, WindowsVersion, CsSystemType, CsProcessorManufacturer, CsProcessorName, CsTotalPhysicalMemory |
    Format-List | Out-String | ForEach-Object { Write-Log $_ }

# CPU Info
Write-Log "`n=== CPU Info ==="
Get-WmiObject Win32_Processor | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors, MaxClockSpeed |
    Format-List | Out-String | ForEach-Object { Write-Log $_ }

# RAM Info
Write-Log "`n=== RAM Info ==="
Get-WmiObject Win32_PhysicalMemory | Select-Object Manufacturer, Speed, Capacity |
    Format-Table | Out-String | ForEach-Object { Write-Log $_ }

# GPU Info
Write-Log "`n=== GPU Info ==="
Get-WmiObject Win32_VideoController | Select-Object Name, AdapterRAM, DriverVersion |
    Format-Table | Out-String | ForEach-Object { Write-Log $_ }

# Storage Info
Write-Log "`n=== Storage Info ==="
Get-WmiObject Win32_DiskDrive | Select-Object Model, MediaType, Size |
    Format-Table | Out-String | ForEach-Object { Write-Log $_ }

# Summary Note
Write-Log "`nAll specs gathered successfully!"

# Final message to console
Write-Host "`nReport saved to: $outputFile" -ForegroundColor Green
