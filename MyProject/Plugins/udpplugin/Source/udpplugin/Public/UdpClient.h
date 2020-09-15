// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"

/**
 * 
 */
DECLARE_DELEGATE_OneParam(FOnUdpClientReceivedata, const TArray<uint8>&);
class UDPPLUGIN_API UdpClient
{
	class RunnableThreadx* Sendreceivethread = nullptr;
	class RunnableThreadx* Receivereceivethread=nullptr;
	TSharedPtr<class FInternetAddr>	RemoteAddr;
	class FSocket* SenderSocket = nullptr;
	class FSocket* ReceiveSocket = nullptr;
	//void SendReceiveWork();
	//void ReceiveReceiveWork();
	uint32 datasize;
	TArray<uint8> datareceive;
	TArray<uint8> RecvBuffer;
	FName protocoltype;
public:
	bool exitthread = false;
	int32 validport = 0;
	void exit();
	UdpClient();
	~UdpClient();
	void setserveraddress(FString ipaddress, int32 port);
	FString listen(int32 port);
	bool Send(const FString& serialized);
	bool Send(const uint8* content, const int32& size);
	FOnUdpClientReceivedata OnUdpClientReceiveddata;
	FOnUdpClientReceivedata OnUdpServerReceiveddata;
};
