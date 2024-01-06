# buildXplaneLibrary opensource-project licensed under CC BY-SA 4.0
# visit repo on https://github.com/DraggeBagge/buildXplaneLibrary

#   CHANGELOG
#   v.1.0.1 added description  /DRAGGEBAGGE
#   v.1.0.2 added support for lin, fac and for filetypes    /DRAGGEBAGGE

$rootFolder = $PSScriptRoot
$fileTypes = @("*.obj","*.str","*.lin","*.fac","*.for")
$libraryFilePath = Join-Path $rootFolder "Library.txt"

If (-Not (Test-Path $libraryFilePath)){
    New-Item -Path $libraryFilePath -ItemType File
}
    # Create Library.txt file
If (-Not (Get-Content $libraryFilePath | Measure-Object).Count -gt 0){
    Add-Content -Path $libraryFilePath -Value "I"
    Add-Content -Path $libraryFilePath -Value "800"
    Add-Content -Path $libraryFilePath -Value "LIBRARY"
}

# get all files of type *.obj and *str in the root folder and sub folders
$files = Get-ChildItem -Path $rootFolder -Include $fileTypes -Recurse 
$newItemsAdded = 0

# Loop through each obj and str file and add to Library.txt if it does not already exist
$currentParentFolderName = ""
ForEach ($file in $files) {
    # get the parent folder name of the current file
    $parentFolderName = Split-Path -Leaf $file.DirectoryName

    # check if the .obj or .str already exists in Library.txt
    $escapedFileFullName = [regex]::Escape($file.FullName)
    $itemAlreadyExists = Select-String $libraryFilePath -Pattern ($escapedFileFullName) -Quiet
    
    # Iterate through Library.txt and check for existing parent folder name matches
    If($currentParentFolderName -ne $parentFolderName){
        $parentFolderNameMatch = Select-String $libraryFilePath -Pattern ("#$parentFolderName") -Quiet 
 
        # append to Library.txt
        If(-Not $itemAlreadyExists -and -Not $parentFolderNameMatch){ 
            Add-Content -Path $libraryFilePath -Value "`n#$parentFolderName"
            $currentParentFolderName = $parentFolderName
        } 
    }

    # append obj, str, lin, fac and for to Library.txt as new row below existing objects
    If(($file.Extension -eq ".obj" -or $file.Extension -eq ".str" -or $file.Extension -eq ".lin" -or $file.Extension -eq ".fac" -or $file.Extension -eq ".for") -and -Not $itemAlreadyExists) { 
        Add-Content -Path $libraryFilePath -Value ("EXPORT " + $file.FullName)
        $newItemsAdded++
    }
}

if ($newItemsAdded -gt 0) {
    Write-Host "Done adding $newItemsAdded new library items. `nPlease check Library.txt for item-list orders errors"
} else {
    Write-Host "No new items identified in Library folder structure. Quitting."
}