// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "Kismet/BlueprintFunctionLibrary.h"

#include "staticLibrary.generated.h"

/**
 * 
 */
UCLASS()
class STATICLIABWIN_API UstaticLibrary : public UBlueprintFunctionLibrary
{
	GENERATED_BODY()
public:
	UFUNCTION(BlueprintCallable, Category = "Mybp")
		static int libte(int a);
	UFUNCTION(BlueprintCallable, Category = "Mybp")
		static bool isportopenfromlib(int port, bool btcp = true);
};
