# Get current folder path
$folderPath = $PSScriptRoot  

# Get all files in the folder
$files = Get-ChildItem -Path $folderPath -File

# Loop through each file
foreach ($file in $files) {
    if ($file.Name -match "abc(.+)xx") {
        $folderName = $matches[1] 
        $destinationFolder = Join-Path -Path $folderPath -ChildPath $folderName
        
        # Create folder if not exists
        if (!(Test-Path -Path $destinationFolder)) {
            New-Item -Path $destinationFolder -ItemType Directory | Out-Null
        }

        # Move file to respective folder
        Move-Item -Path $file.FullName -Destination $destinationFolder -Force
        Write-Host "Moved: $($file.Name) -> $destinationFolder"
    }
}

Write-Host "Organizing completed."
