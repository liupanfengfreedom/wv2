// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "Animation/AnimInstance.h"
#include "VirtualCharactorainmbp.generated.h"

/**
 * 
 */
UCLASS()
class APPPLUGIN_API UVirtualCharactorainmbp : public UAnimInstance
{
	GENERATED_BODY()
public:
	UPROPERTY(BlueprintReadWrite,EditAnyWhere)
		FRotator headrotation;
	UPROPERTY(BlueprintReadWrite, EditAnyWhere)
		FRotator neckrotation;
};
