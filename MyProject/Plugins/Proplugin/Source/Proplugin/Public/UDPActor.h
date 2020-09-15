// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Actor.h"

#include "UDPActor.generated.h"

UCLASS()
class PROPLUGIN_API AUDPActor : public AActor
{
	GENERATED_BODY()
	class UdpClient*	mudpclient=nullptr;
	class RunnableThreadx* workerhread = nullptr;
	TArray<FName> morphtargetnames;
	float mv[63 + 6];
	FString strt;
public:	
	// Sets default values for this actor's properties
	AUDPActor();
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
		class ACharacter* datasourcecharactor;
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
		class USkeletalMeshComponent* muskc;
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
		class UAnimInstance* animp_datasourcecharactor;
protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;
	virtual void EndPlay(const EEndPlayReason::Type EndPlayReason) override;
	bool b_isportopen;
	int portstart = 8080;

public:	
	// Called every frame
	virtual void Tick(float DeltaTime) override;
	UFUNCTION(BlueprintCallable)
		void init();
	DECLARE_DYNAMIC_MULTICAST_DELEGATE_TwoParams(FOnpastrotation, FRotator, head, FRotator, neck);
	UPROPERTY(BlueprintAssignable)
		FOnpastrotation pastrotationevent;
};
