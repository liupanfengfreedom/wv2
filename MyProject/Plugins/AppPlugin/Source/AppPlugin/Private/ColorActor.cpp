// Fill out your copyright notice in the Description page of Project Settings.


#include "ColorActor.h"
#include "MessageManager.h"
#include "KeyMap.h"
#include "Engine.h"
// Sets default values
AColorActor::AColorActor()
{
 	// Set this actor to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;

}
void AColorActor::EndPlay(const EEndPlayReason::Type EndPlayReason)
{
	REMOVEMESSAGELISTEN(this)
}

// Called when the game starts or when spawned
void AColorActor::BeginPlay()
{
	Super::BeginPlay();
	ADDMESSAGELISTEN(this, key_onalphacontrolvalue, [=](const void* p) {
	   GEngine->AddOnScreenDebugMessage(-1, 5.0f, FColor::Yellow, TEXT("key_onalphacontrolvalue-----------------------------cpp"));
	})
}

// Called every frame
void AColorActor::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

}

