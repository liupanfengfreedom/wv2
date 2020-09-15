// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "Kismet/BlueprintFunctionLibrary.h"
#include "AppFunctionLibrary.generated.h"

/**
 * 
 */
UCLASS()
class APPPLUGIN_API UAppFunctionLibrary : public UBlueprintFunctionLibrary
{
	GENERATED_BODY()
public:
	//UFUNCTION(BlueprintCallable, Category = "AppFunctionLibrary")
	//	static void geturl(TArray<FString>& urls);
	//UFUNCTION(BlueprintCallable, Category = "AppFunctionLibrary")
	//	static void getcolor(FLinearColor& c);

























////////////////////////////////////////////////////////////////////
	UFUNCTION(BlueprintCallable, Category = "AppFunctionLibrary")
		static bool importDLL(FString folder, FString name);
	UFUNCTION(BlueprintCallable, Category = "AppFunctionLibrary")
		static bool importMethodisportopen();
	UFUNCTION(BlueprintCallable, Category = "AppFunctionLibrary")
		static bool isportopenFromDll(int port, bool btcp = true);
	UFUNCTION(BlueprintCallable, Category = "AppFunctionLibrary")
		static void freeDLL();
};
