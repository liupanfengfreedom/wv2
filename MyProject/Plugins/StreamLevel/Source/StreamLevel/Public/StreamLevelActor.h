// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Actor.h"
#include "StreamLevelActor.generated.h"

UCLASS()
class STREAMLEVEL_API AStreamLevelActor : public AActor
{
	GENERATED_BODY()
	
	class ULevelStreamingDynamic * createlevel = nullptr;
	class ULevelStreaming* currentlevel;
	FName willloadlevelname;
public:
	// Sets default values for this actor's properties
	AStreamLevelActor();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

public:
	// Called every frame
	virtual void Tick(float DeltaTime) override;
public:
	UFUNCTION(BlueprintCallable)
		void ClearpreLevelandLoadstreamlevel(FName levelname);
	UFUNCTION(BlueprintCallable)
		void ClearpreLevelandLoadstreamlevelv1();
	UFUNCTION(BlueprintCallable)
		void loadstreamlevel(FName levelname);
	UFUNCTION(BlueprintCallable)
		void Onlevelloaded();
};
