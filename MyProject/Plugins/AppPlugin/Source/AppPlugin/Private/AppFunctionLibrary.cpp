// Fill out your copyright notice in the Description page of Project Settings.


#include "AppFunctionLibrary.h"
#include "Media/Public/IMediaCaptureSupport.h"
#include "MediaUtils/Public/MediaCaptureSupport.h"
#include "Slate/Public/Framework/Application/SlateApplication.h"
#include "ApplicationCore/Public/Windows/WindowsPlatformApplicationMisc.h"
#include "Engine.h"
//void UAppFunctionLibrary::geturl(TArray<FString>& urls)
//{
//	TArray<FMediaCaptureDeviceInfo> DeviceInfos;
//	MediaCaptureSupport::EnumerateVideoCaptureDevices(DeviceInfos);
//	for (auto var : DeviceInfos)
//	{
//		urls.Add(var.DisplayName.ToString()+"?"+var.Url);
//	}
//}
//void UAppFunctionLibrary::getcolor(FLinearColor& c)
//{
//	FVector2D CurrentCursorPosition = FSlateApplication::Get().GetCursorPos();
//
//	{
//		// In dropper mode and outside the button - sample the pixel color and push it to the client
//		// Convert the display gamma into a ratio of gamma from the default gamma.
//	//	float Gamma = DisplayGamma.Get(2.2f) / 2.2f;
//		FLinearColor ScreenColor = FPlatformApplicationMisc::GetScreenPixelColor(CurrentCursorPosition, 1.0f/*Gamma*/);
//		c = ScreenColor;
//	}
//}














///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
typedef bool (*_isportopen)(int port, bool btcp); // Declare a method to store the DLL method isportopen.
_isportopen m__isportopenFromDll;
void* v_dllHandle;
#pragma region Load DLL

// Method to import a DLL.
bool UAppFunctionLibrary::importDLL(FString folder, FString name)
{
	FString filePath = *FPaths::GamePluginsDir() + folder + "/" + name;

	if (FPaths::FileExists(filePath))
	{
		GEngine->AddOnScreenDebugMessage(-1, 22.0f, FColor::Yellow, "FPaths::FileExists  true");

		v_dllHandle = FPlatformProcess::GetDllHandle(*filePath); // Retrieve the DLL.
		if (v_dllHandle != NULL)
		{
			return true;
		}
	}
	else
	{
		GEngine->AddOnScreenDebugMessage(-1, 22.0f, FColor::Yellow, "FPaths::FileExists  false");

	}
	return false;	// Return an error.
}
#pragma endregion Load DLL

#pragma region Import Methods

// Imports the method getInvertedBool from the DLL.
bool UAppFunctionLibrary::importMethodisportopen()
{
	if (v_dllHandle != NULL)
	{
		m__isportopenFromDll = NULL;
		FString procName = "isportopen";	// Needs to be the exact name of the DLL method.
		m__isportopenFromDll = (_isportopen)FPlatformProcess::GetDllExport(v_dllHandle, *procName);
		if (m__isportopenFromDll != NULL)
		{
			return true;
		}
	}
	return false;	// Return an error.
}
#pragma endregion Import Methods

#pragma region Method Calls

// Calls the method getInvertedBoolFromDll that was imported from the DLL.
bool UAppFunctionLibrary::isportopenFromDll(int port, bool btcp)
{
	if (m__isportopenFromDll != NULL)
	{
		bool out = bool(m__isportopenFromDll(port,btcp)); // Call the DLL method with arguments corresponding to the exact signature and return type of the method.
		return out;
	}
	return true;
}

#pragma endregion Method Calls
#pragma region Unload DLL

// If you love something  set it free.
void UAppFunctionLibrary::freeDLL()
{
	if (v_dllHandle != NULL)
	{
		m__isportopenFromDll = NULL;
		FPlatformProcess::FreeDllHandle(v_dllHandle);
		v_dllHandle = NULL;
	}
}
#pragma endregion Unload DLL