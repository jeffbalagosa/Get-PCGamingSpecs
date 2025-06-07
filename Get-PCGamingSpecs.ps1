# Get-PCGamingSpecs.ps1

# System Info
Write-Host "=== System Information ===" -ForegroundColor Cyan
Get-ComputerInfo | Select-Object OSName, OSArchitecture, WindowsVersion, CsSystemType, CsProcessorManufacturer, CsProcessorName, CsTotalPhysicalMemory | Format-List

# CPU Info
Write-Host "`n=== CPU Info ===" -ForegroundColor Cyan
Get-WmiObject Win32_Processor | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors, MaxClockSpeed | Format-List

# RAM Info
Write-Host "`n=== RAM Info ===" -ForegroundColor Cyan
Get-WmiObject Win32_PhysicalMemory | Select-Object Manufacturer, Speed, Capacity | Format-Table

# GPU Info
Write-Host "`n=== GPU Info ===" -ForegroundColor Cyan
Get-WmiObject Win32_VideoController | Select-Object Name, AdapterRAM, DriverVersion | Format-Table

# Storage Info
Write-Host "`n=== Storage Info ===" -ForegroundColor Cyan
Get-WmiObject Win32_DiskDrive | Select-Object Model, MediaType, Size | Format-Table

# Summary Note
Write-Host "`nAll specs gathered successfully!" -ForegroundColor Green
