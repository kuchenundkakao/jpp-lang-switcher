gamedir = "INSTALLATIONSPFAD HIER EINFUEGEN"

Set fso = CreateObject("Scripting.FileSystemObject")
scriptdir = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)
backupdir = scriptdir + "\backup_original_files"
locdir = scriptdir + "\localized_files"
Set objFolder = fso.GetFolder(backupdir)
If objFolder.Files.Count = 0 And objFolder.SubFolders.Count = 0 Then
	Set resultFiles = CreateObject("Scripting.Dictionary")
	GetAllFiles locdir, resultFiles
	For Each file in resultFiles.Items
		mafolder = Replace(file.ParentFolder.Path, locdir, backupdir)
		If (fso.FolderExists(mafolder)) Then
		Else
			BuildFullPath mafolder
		End If
		copyto = Replace(file.Path, locdir, backupdir)
		copyfrom = Replace(file.Path, locdir, gamedir)
		if (fso.FileExists(copyfrom)) Then
			fso.CopyFile copyfrom, copyto, True
		End If
		fso.CopyFile file.Path, copyfrom, True
	Next
	MsgBox "Sprache erfolgreich in lokalisierte Version gewechselt."
Else
	MsgBox "Backup-Ordner ist nicht leer. Sicherheitshalber abgebrochen. Wurde bereits gewechselt?"
End If

Function GetAllFiles(folder, resultFiles)
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set folder = fso.GetFolder(folder)

    Set files = folder.Files
    For Each file in files
        resultFiles.Add resultFiles.Count, file
    Next

    Set subFolders = folder.SubFolders
    For Each subFolder in subFolders
        GetAllFiles subFolder.Path, resultFiles
    Next
End Function

Sub BuildFullPath(ByVal FullPath)
  If Not fso.FolderExists(FullPath) Then
    BuildFullPath fso.GetParentFolderName(FullPath)
    fso.CreateFolder FullPath
  End If
End Sub
