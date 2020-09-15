// Fill out your copyright notice in the Description page of Project Settings.


#include "VirtualCharacter.h"
#include "MessageManager.h"
#include "KeyMap.h"
#include "Dom/JsonObject.h"
#include "Serialization/JsonReader.h"
#include "Serialization/JsonSerializer.h"
#include "Engine.h"
// Sets default values
AVirtualCharacter::AVirtualCharacter()
{
 	// Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;

}
void AVirtualCharacter::EndPlay(const EEndPlayReason::Type EndPlayReason)
{
	REMOVEMESSAGELISTEN(this)
}

// Called when the game starts or when spawned
void AVirtualCharacter::BeginPlay()
{
	Super::BeginPlay();
	ADDMESSAGELISTEN(this, key_changecharater,
		[this](const void* const pd) {
			FString strjson = *(FString*)pd;
			TSharedPtr<FJsonObject> payload = MakeShareable(new FJsonObject);
			TSharedRef< TJsonReader<> > Reader = TJsonReaderFactory<>::Create(strjson);
			FJsonSerializer::Deserialize(Reader, payload);
			FString assetpath;
			FString animationBPclasspath;
			bool b = payload->TryGetStringField("skeletamesh", assetpath);
			//GEngine->AddOnScreenDebugMessage(-1, 5.0f, FColor::Yellow, assetpath);

			if (!b)
			{
				GEngine->AddOnScreenDebugMessage(-1, 5.0f, FColor::Yellow, FString("get skeletamesh from json failed!"));
			}

			USkeletalMesh* sm = LoadObject<USkeletalMesh>(NULL, *assetpath);
			if (sm)
			{
				GEngine->AddOnScreenDebugMessage(-1, 15.0f, FColor::Yellow, TEXT("UStaticMesh load ok!"));
			}
			else
			{
				GEngine->AddOnScreenDebugMessage(-1, 15.0f, FColor::Yellow, TEXT("UStaticMesh load failed!"));
				return;
			}
			GetMesh()->SetSkeletalMesh(sm);
			double scale;
			b = payload->TryGetNumberField("scale",scale);
			if (b)
			{
				GetMesh()->SetRelativeScale3D(FVector(scale));
				GEngine->AddOnScreenDebugMessage(-1, 15.0f, FColor::Yellow, TEXT("SetRelativeScale3D"));
			}
			FVector position;
			b = payload->TryGetNumberField("positionx", scale);
			if (b)
			{
				position.X = scale;
				GEngine->AddOnScreenDebugMessage(-1, 15.0f, FColor::Yellow, TEXT("positionx"));
			}
			b = payload->TryGetNumberField("positiony", scale);
			if (b)
			{
				position.Y = scale;
				GEngine->AddOnScreenDebugMessage(-1, 15.0f, FColor::Yellow, TEXT("positiony"));
			}
			b = payload->TryGetNumberField("positionz", scale);
			if (b)
			{
				position.Z = scale;
				GetMesh()->SetRelativeLocation(position);
				GEngine->AddOnScreenDebugMessage(-1, 15.0f, FColor::Yellow, TEXT("positionz"));
			}

/////////////////////////////////////////////////////////////////////////////////////
			
			b = payload->TryGetStringField("animbp", animationBPclasspath);
			if (!b)
			{
				GEngine->AddOnScreenDebugMessage(-1, 5.0f, FColor::Yellow, FString("get AnimSequences from json failed!"));
			}
			else
			{
				UClass* bodyanimation = LoadClass<UObject>(nullptr, *animationBPclasspath);
				GetMesh()->SetAnimationMode(EAnimationMode::Type::AnimationBlueprint);
				GetMesh()->SetAnimInstanceClass(bodyanimation);
			}
			/// <summary>
//////////////////////////////////////////////////////////////////////////////////////////////////////////
			/// </summary>

			//const TArray< TSharedPtr<FJsonValue> >* AnimSequences;
			//b = payload->TryGetArrayField("AnimSequences", AnimSequences);
			//if (!b)
			//{
			//	GEngine->AddOnScreenDebugMessage(-1, 5.0f, FColor::Yellow, FString("get AnimSequences from json failed!"));
			//}
			//else
			//{
			//const TSharedPtr<FJsonObject>* arrayobject;
			//(*AnimSequences)[0]->TryGetObject(arrayobject);
			//animationclasspath = (*arrayobject)->GetStringField("animsequence");
			//UAnimationAsset* bodyanimation = LoadObject<UAnimationAsset>(nullptr, *animationclasspath);
			//GetMesh()->SetAnimationMode(EAnimationMode::Type::AnimationSingleNode);
			//GetMesh()->PlayAnimation(bodyanimation, true);
			//}
		}
	)
		ADDMESSAGELISTEN(this, key_changecharateranimation,
			[this](const void* const pd) {
				FString animationclasspath;
				animationclasspath = *((FString*)pd);
				UAnimationAsset* bodyanimation = LoadObject<UAnimationAsset>(nullptr, *animationclasspath);
				GetMesh()->SetAnimationMode(EAnimationMode::Type::AnimationSingleNode);
				GetMesh()->PlayAnimation(bodyanimation, true);
		}
	)
}

// Called every frame
void AVirtualCharacter::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

}

// Called to bind functionality to input
void AVirtualCharacter::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);

}

