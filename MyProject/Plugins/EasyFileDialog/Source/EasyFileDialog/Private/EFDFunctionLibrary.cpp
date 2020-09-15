// Copyright 2017-2020 Firefly Studio. All Rights Reserved.


#include "EFDFunctionLibrary.h"
//#include "Engine.h"
#include "GenericPlatform/GenericPlatformFile.h"
#include "HAL/PlatformFilemanager.h"
bool UEFDFunctionLibrary::OpenFileDialog(const FString& DialogTitle, const FString& DefaultPath, const FString& DefaultFile, const FString& FileTypes, EEasyFileDialogFlags Flags, TArray< FString >& OutFilenames)
{
    // Calling the core class function for open file dialog
    return  EFDCore::OpenFileDialogCore(DialogTitle, DefaultPath, DefaultFile, FileTypes, Flags, OutFilenames);
}



bool UEFDFunctionLibrary::SaveFileDialog(const FString& DialogTitle, const FString& DefaultPath, const FString& DefaultFile, const FString& FileTypeDescription, const FString& FileType, EEasyFileDialogFlags Flags, TArray<FString>& OutFilenames)
{
    // Saving the file type and file type description to append and Removing . if user provides any
    FString TempFileType = FileType.Replace(TEXT("."), TEXT(""));
  
    FString TempFileTypeDescription = FileTypeDescription;  

    // Setting description if user did not provide any
    if (TempFileTypeDescription.IsEmpty())
    {
        TempFileTypeDescription = TempFileType.ToUpper();
    }

    // Creating final file types by appending FileTypeDescription and FileType
    const FString FinalFileType = TempFileTypeDescription.Append("|").Append(".").Append(TempFileType);

    // Calling the core class function for save file dialog
    return EFDCore::SaveFileDialogCore(DialogTitle, DefaultPath, DefaultFile, FinalFileType, Flags, OutFilenames);
}


const FString& UEFDFunctionLibrary::OpenFolderDialog(const FString& DialogTitle, const FString& DefaultPath, FString& OutFolderName)
{
    // Calling the core class function for open folder dialog
     EFDCore::OpenFolderDialogCore(DialogTitle, DefaultPath, OutFolderName);
     return OutFolderName;
}
void UEFDFunctionLibrary::Directorycopy(const FString& source, const FString& destination)
{
    IPlatformFile& PlatformFile = FPlatformFileManager::Get().GetPlatformFile();
    Async(EAsyncExecution::ThreadPool, [=,&PlatformFile]() {
        PlatformFile.CopyDirectoryTree(*destination, *source, true);
    }, nullptr);
}