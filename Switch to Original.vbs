gamedir = "INSTALLATIONSPFAD HIER EINFUEGEN"

scriptdir = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)
backupdir = scriptdir + "\backup_original_files"
locdir = scriptdir + "\localized_files"
Set fso = CreateObject("Scripting.FileSystemObject")
Set objFolder = fso.GetFolder(backupdir)
If objFolder.Files.Count = 0 And objFolder.SubFolders.Count = 0 Then
	MsgBox "Backup-Ordner ist leer. Wurde bereits auf Original gewechselt?"
Else
	Set resultFiles = CreateObject("Scripting.Dictionary")
	GetAllFiles backupdir, resultFiles
	For Each file in resultFiles.Items
		copyto = Replace(file.Path, backupdir, gamedir)
		copyfrom = file.Path
		fso.CopyFile copyfrom, copyto, True
	Next
	folderdelete = backupdir & "\*"
	fso.DeleteFolder folderdelete, True
	fso.DeleteFile folderdelete, True
	MsgBox "Backup-Dateien erfolgreich wiederhergestellt. Jackbox ist jetzt wieder in der Originalsprache."	
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