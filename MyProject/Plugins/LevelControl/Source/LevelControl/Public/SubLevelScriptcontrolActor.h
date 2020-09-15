// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "Engine/LevelScriptActor.h"
#include "Slua_LevelScriptActor.h"
#include "SubLevelScriptcontrolActor.generated.h"
USTRUCT()
struct FArchivestructCL {
	GENERATED_BODY()

		UPROPERTY()
		FString staticmeshpath;
	UPROPERTY()
		FVector  location;
	UPROPERTY()
		FRotator rotator;
	UPROPERTY()
		FVector scale;
	FArchivestructCL() {
		staticmeshpath = "";
		location = FVector::ZeroVector;
		rotator = FRotator::ZeroRotator;
		scale = FVector::ZeroVector;
	}
};
USTRUCT()
struct FArchiveListCL {
	GENERATED_BODY()
		UPROPERTY()
		FString  name;
	UPROPERTY()
		TArray<FArchivestructCL> objectlist;
	FArchiveListCL() {
		objectlist.Empty();
		name = "";
	}

};
/**
 * 
 */
UCLASS()
class LEVELCONTROL_API ASubLevelScriptcontrolActor : public ASlua_LevelScriptActor//ALevelScriptActor
{
	GENERATED_BODY()
	FName currentlevel;
	FTimerHandle th;
	void timerwork();
	class AStreamLevelActor* streamlevelactor;
	bool bflip;
public:
	~ASubLevelScriptcontrolActor();
protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;
	UFUNCTION(BlueprintImplementableEvent)
		void loadstreaminglevel(const FName & name);
	UFUNCTION(BlueprintImplementableEvent)
		void unloadstreaminglevel(const FName& name);
private:
	TArray<AActor*>actorarray;
	void generatemap(FString mapinforfile);
};
