// Fill out your copyright notice in the Description page of Project Settings.


#include "ServerdefaultLevelScript.h"
#include "Runtime/Engine/Classes/Kismet/KismetSystemLibrary.h"
#include "UTcpCommunicatorv2.h"
#include "MyBlueprintFunctionLibrary.h"
#include "Runtime/Engine/Classes/Engine/World.h"
void AServerdefaultLevelScript::BeginPlay()
{
	bool b = UKismetSystemLibrary::IsDedicatedServer(this);
	UMyBlueprintFunctionLibrary::CLogtofile("AServerdefaultLevelScript");
	if (!b)
	{
		UMyBlueprintFunctionLibrary::CLogtofile("AServerdefaultLevelScript clientside");
		matchclient = UUTcpCommunicatorv2::GetMatchClient();
		check(matchclient);
		matchclient->EntyMapOkMessage();
	}
}