// Fill out your copyright notice in the Description page of Project Settings.


#include "UDPActor.h"
#include "UdpClient.h"
#include "GameFramework/Character.h"
#include "RunnableThreadx.h"
#include "JsonUtilities/Public/JsonUtilities.h"
#include "Json.h"
#include "Animation/AnimInstance.h"
#include "AppFunctionLibrary.h"
#include "Engine.h"
#include "HttpServiceRaw.h"
#include "staticLibrary.h"

// Sets default values
AUDPActor::AUDPActor()
{
 	// Set this actor to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;

}
void AUDPActor::EndPlay(const EEndPlayReason::Type EndPlayReason)
{
	Super::EndPlay(EndPlayReason);
	mudpclient->exit();
	if (workerhread)
	{
		if (!workerhread->IsThreadKilled())
		{
			workerhread->StopThread();
		}
	}
	TSharedPtr<HttpServiceRaw, ESPMode::ThreadSafe> tlff = HttpServiceRaw::GetANewInstance();
	tlff->HttpPost("http://47.101.160.43:7000/", "843A58C72161787A98C23CD33AAE66F9", "exit","", "");
}
void AUDPActor::init()
{

	if (datasourcecharactor)
	{
		animp_datasourcecharactor = datasourcecharactor->GetMesh()->GetAnimInstance();
	}
	if (muskc)
	{
		animp_datasourcecharactor = muskc->GetAnimInstance();
	}
	TSharedPtr<FJsonObject> ImportGroups1 = MakeShareable(new FJsonObject);
	FString jsonfilepath = FPaths::ProjectContentDir() + "ini/morph.ini";
	FString content;
	FFileHelper::LoadFileToString(content, *jsonfilepath);
	TSharedRef< TJsonReader<> > Reader = TJsonReaderFactory<>::Create(content);
	FJsonSerializer::Deserialize(Reader, ImportGroups1);
	const TArray< TSharedPtr<FJsonValue> > Array1 = ImportGroups1->GetArrayField("morphtarget");
	morphtargetnames.Empty();
	for (auto var : Array1)
	{
		morphtargetnames.Add(FName(*var->AsString()));
	}
	//mudpclient = MakeShareable(new UdpClient());
	mudpclient = new UdpClient();
	//mhttp = new HttpServiceRaw();
	mudpclient->OnUdpServerReceiveddata.BindLambda([=](const TArray<uint8>& ds) {

		FMemory::Memcpy(mv, ds.GetData(), sizeof(mv));

		for (int i = 0; i < morphtargetnames.Num(); i++)
		{
			AsyncTask(
				ENamedThreads::GameThread,
				[=]() {
					//GEngine->AddOnScreenDebugMessage(-1, 1.0f, FColor::Yellow, morphtargetnames[i].ToString().Append(FString::SanitizeFloat(mv[i])));
					animp_datasourcecharactor->SetMorphTarget(morphtargetnames[i], mv[i]);
				}
			);

		}
		pastrotationevent.Broadcast(FRotator(mv[63], mv[63 + 1], mv[63 + 2]), FRotator(mv[63 + 3], mv[63 + 4], mv[63 + 5]));
		//GEngine->AddOnScreenDebugMessage(-1, 21.0f, FColor::Yellow, FString::SanitizeFloat(ds.Num()));
	});

	workerhread = new RunnableThreadx([=]() {
		FPlatformProcess::Sleep(0.2f);
		if (!UstaticLibrary::isportopenfromlib(portstart, false))
		{
		   FString ip = mudpclient->listen(portstart);
		   AsyncTask(
			   ENamedThreads::GameThread,
			   [=]() {
				   GEngine->AddOnScreenDebugMessage(-1, 21.0f, FColor::Yellow, ip+" : "+FString::SanitizeFloat(mudpclient->validport));
			   }
		   );
		   TSharedPtr<HttpServiceRaw, ESPMode::ThreadSafe> tlff = HttpServiceRaw::GetANewInstance();
		   tlff->HttpPost("http://47.101.160.43:7000/", "843A58C72161787A98C23CD33AAE66F9", "", ip + "?" + FString::FromInt(mudpclient->validport), "");
		   workerhread->StopThread();
		   workerhread = nullptr;
		}
		portstart++;
		});
}
// Called when the game starts or when spawned
void AUDPActor::BeginPlay()
{
	Super::BeginPlay();

}

// Called every frame
void AUDPActor::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

}

