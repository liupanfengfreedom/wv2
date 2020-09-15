// Fill out your copyright notice in the Description page of Project Settings.


#include "StreamLevelActor.h"
#include "Engine.h"
#include "Runtime/Engine/Classes/Engine/LevelStreaming.h"
#include "Runtime/Engine/Classes/Engine/World.h"
#include "Runtime/Engine/Classes/Kismet/GameplayStatics.h"
// Sets default values
AStreamLevelActor::AStreamLevelActor()
{
 	// Set this actor to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = false;

}

// Called when the game starts or when spawned
void AStreamLevelActor::BeginPlay()
{
	Super::BeginPlay();
	
}

// Called every frame
void AStreamLevelActor::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

}
void AStreamLevelActor::ClearpreLevelandLoadstreamlevel(FName levelname)
{
	willloadlevelname = levelname;
	FLatentActionInfo info;
	info.CallbackTarget = this;
	info.ExecutionFunction = "ClearpreLevelandLoadstreamlevelv1";
	info.UUID = 1;
	info.Linkage = 0;
	const TArray<ULevelStreaming*>& StreamedLevels = GetWorld()->GetStreamingLevels();
	if (StreamedLevels.Num() == 0)
	{
		loadstreamlevel(levelname);


		return;
	}
	else
	{
		UGameplayStatics::UnloadStreamLevel(this, StreamedLevels[0]->GetWorldAssetPackageFName(), info, true);
		currentlevel = StreamedLevels[0];
	}
}
void AStreamLevelActor::ClearpreLevelandLoadstreamlevelv1()
{
	ClearpreLevelandLoadstreamlevel(willloadlevelname);
	GetWorld()->RemoveStreamingLevel(currentlevel);
}
void AStreamLevelActor::loadstreamlevel(FName levename)
{
	//UGameplayStatics::LoadStreamLevel(GetWorld(), levelname, true, false, FLatentActionInfo());
	ULevelStreamingKismet* StreamingLevel = static_cast<ULevelStreamingKismet*>(StaticConstructObject_Internal(ULevelStreamingKismet::StaticClass(), GetWorld(), NAME_None, RF_NoFlags));
	StreamingLevel->SetWorldAssetByPackageName(levename);
	StreamingLevel->LevelColor = FColor::MakeRandomColor();
	StreamingLevel->bShouldBlockOnLoad = false;
	StreamingLevel->bInitiallyLoaded = false;
	StreamingLevel->bInitiallyVisible = false;
	//StreamingLevel->LevelTransform = // where to put it

	StreamingLevel->PackageNameToLoad = levename;// PackageName containing level to load

	FString PackageFileName;
	if (!FPackageName::DoesPackageExist(StreamingLevel->PackageNameToLoad.ToString(), NULL, &PackageFileName))
	{
		//	//UE_LOG(LogStreamingLevel, Error, TEXT("trying to load invalid level %s"), *StreamingLevel->PackageNameToLoad.ToString());
	}

	StreamingLevel->PackageNameToLoad = FName(*FPackageName::FilenameToLongPackageName(PackageFileName));
	// Add the new level to world.
	GetWorld()->AddStreamingLevel(StreamingLevel);

	bool b = false;
	// createlevel = ULevelStreamingKismet::LoadLevelInstance(this, levename.ToString(),FVector::ZeroVector,FRotator::ZeroRotator,b);
	FLatentActionInfo info;
	info.CallbackTarget = this;
	info.ExecutionFunction = "Onlevelloaded";
	info.UUID = 1;
	info.Linkage = 0;
	UGameplayStatics::LoadStreamLevel(this, levename, true, true, info);
	//blueprintloadlevel(levename);
}
void AStreamLevelActor::Onlevelloaded()
{
	//GEngine->AddOnScreenDebugMessage(-1, 15.0f, FColor::Yellow, TEXT("Onlevelloaded"));
}

