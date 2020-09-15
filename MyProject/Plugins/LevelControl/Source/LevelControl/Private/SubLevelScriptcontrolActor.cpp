// Fill out your copyright notice in the Description page of Project Settings.


#include "SubLevelScriptcontrolActor.h"
#include "MessageManager.h"
#include "KeyMap.h"
#include "Engine.h"
#include "Kismet/GameplayStatics.h"
#include "StreamLevelActor.h"
#include "Kismet/GameplayStatics.h"
#include "JsonObjectConverter.h"
#include "Engine/StaticMeshActor.h"
#include "MyBlueprintFunctionLibrary.h"

ASubLevelScriptcontrolActor::~ASubLevelScriptcontrolActor()
{
	REMOVEMESSAGELISTEN(this);

}
void ASubLevelScriptcontrolActor::BeginPlay()
{
	Super::BeginPlay();
	streamlevelactor = GetWorld()->SpawnActor<AStreamLevelActor>(AStreamLevelActor::StaticClass());
	//World'/Game/BroadcastStudio/Maps/mainShowcase.mainShowcase'
	//streamlevelactor->ClearpreLevelandLoadstreamlevel(FName("/Game/fortest/maps/NewMap"));//default
	//World'/Game/Assets/Scenes/01_Virtual_Sport/Maps/01_Virtual_Sport.01_Virtual_Sport'
	streamlevelactor->ClearpreLevelandLoadstreamlevel(FName("/Game/Assets/Scenes/02_Studio_News/Maps/02_Studio_News"));//default
	//currentlevel = "/Game/Maps/Scene002";
	//UGameplayStatics::LoadStreamLevel(GetWorld(), currentlevel, true, true, FLatentActionInfo());
	//loadstreaminglevel(currentlevel);
	ADDMESSAGELISTEN(this, key_changebackground,
		[this](const void* const pd) {
			FString namestr = *((FString*)(pd));
			//GEngine->AddOnScreenDebugMessage(-1, 5.0f, FColor::Yellow, *namestr);
			//for (int i = 0; i < actorarray.Num(); i++)
			//{
			//	actorarray[i]->Destroy();
			//}
			//actorarray.Empty();

			//if (namestr.Left(1) == "/")
			{
				FName name = FName(*namestr);
				GEngine->AddOnScreenDebugMessage(-1, .7f, FColor::Yellow, name.ToString());
				streamlevelactor->ClearpreLevelandLoadstreamlevel(name);
			}
			//else
			//{//World'/Game/blankmap.blankmap'
			//	streamlevelactor->ClearpreLevelandLoadstreamlevel("/Game/blankmap");
			//	generatemap(namestr);
			//}

			//UGameplayStatics::UnloadStreamLevel(GetWorld(), currentlevel, FLatentActionInfo(),true);
			//UGameplayStatics::LoadStreamLevel(GetWorld(), name, true, true, FLatentActionInfo());
			//unloadstreaminglevel(currentlevel);
			//loadstreaminglevel(name);
		}
	)
		//GetWorld()->GetTimerManager().SetTimer(th,this, &ASubLevelScriptcontrolActor::timerwork,3,true,3);
}
void ASubLevelScriptcontrolActor::generatemap(FString mapinforfile)
{
	FString Contentdir = FPaths::ProjectContentDir();
	Contentdir.Append("Movies/");
	Contentdir.Append(mapinforfile);
	bool fb = FPaths::FileExists(Contentdir);
	GEngine->AddOnScreenDebugMessage(-1, 5.0f, FColor::Yellow, Contentdir);
	if (fb)
	{
		//		FString AbsPakPath = FPaths::ConvertRelativePathToFull(Contentdir);
		FString AbsPakPath = Contentdir;// UMobileUtilsBlueprintLibrary::ConvertToAbsolutePath(Contentdir);
		GEngine->AddOnScreenDebugMessage(-1, 15.0f, FColor::Yellow, AbsPakPath + FString(" AbsPakPath"));
		FString content;
		UMyBlueprintFunctionLibrary::readstringfromfile(AbsPakPath, content);
		GEngine->AddOnScreenDebugMessage(-1, 15.0f, FColor::Yellow, content + FString(" : content"));
		FArchiveListCL info;
		FJsonObjectConverter::JsonObjectStringToUStruct<FArchiveListCL>(content, &info, 0, 0);
		GEngine->AddOnScreenDebugMessage(-1, 15.0f, FColor::Yellow, FString::FromInt(info.objectlist.Num()).Append(" infosize"));
		for (auto var : info.objectlist)
		{
			FVector Location = var.location;
			FRotator Rotation = var.rotator;
			FActorSpawnParameters ActorSpawnParams;
			ActorSpawnParams.SpawnCollisionHandlingOverride = ESpawnActorCollisionHandlingMethod::AlwaysSpawn;
			AStaticMeshActor * mactor = GetWorld()->SpawnActor<AStaticMeshActor>(AStaticMeshActor::StaticClass(), Location, Rotation, ActorSpawnParams);
			mactor->SetMobility(EComponentMobility::Movable);
			UStaticMesh* mstaticmesh = LoadObject<UStaticMesh>(NULL, *var.staticmeshpath);
			if (mstaticmesh)
			{
				GEngine->AddOnScreenDebugMessage(-1, 5.0f, FColor::Yellow, TEXT("mstaticmesh is not null"));

			}
			else
			{
				GEngine->AddOnScreenDebugMessage(-1, 5.0f, FColor::Yellow, TEXT("mstaticmesh is null"));

			}
			mactor->GetStaticMeshComponent()->SetStaticMesh(mstaticmesh);
			actorarray.Add(mactor);
		}
	}
	else
	{
		GEngine->AddOnScreenDebugMessage(-1, 5.0f, FColor::Yellow, TEXT(".ini path no exist"));
	}
}
void ASubLevelScriptcontrolActor::timerwork()
{
	if (bflip)
	{
		streamlevelactor->ClearpreLevelandLoadstreamlevel(FName("/Game/sub1"));
	}
	else
	{
		streamlevelactor->ClearpreLevelandLoadstreamlevel(FName("/Game/sub2"));
	}
	bflip = !bflip;
}