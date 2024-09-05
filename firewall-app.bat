# 
# 
# 

# Указываем путь к директории
$directoryPath = "C:\path\to\new"

# Добавляем новые расширения исполняемых файлов
$fileExtensions = @('*.exe', '*.msi', '*.bat', '*.cmd', '*.ps1', '*.vbs', '*.js', '*.jar', '*.com', '*.cpl', '*.scr', '*.hta')
$files = Get-ChildItem -Path $directoryPath -Recurse -Include $fileExtensions

# Проходим по каждому файлу и создаем правило в брандмауэре
foreach ($file in $files) {
    $programPath = $file.FullName
    $ruleName = "Izolation_Network_by_Aleks_$($file.Name)"
    
    # Создаем правило для каждого найденного файла
    New-NetFirewallRule -DisplayName $ruleName -Direction Outbound -Program $programPath -Action Block
}

Write-Host "Firewall rules created for all executable files in $directoryPath"
