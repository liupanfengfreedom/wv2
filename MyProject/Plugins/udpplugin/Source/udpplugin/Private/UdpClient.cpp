// Fill out your copyright notice in the Description page of Project Settings.


#include "UdpClient.h"
#include "Networking/Public/Networking.h"
#include "Engine.h"
#include "RunnableThreadx.h"

UdpClient::UdpClient()
{
	//SenderSocket = FUdpSocketBuilder(FString("normal"))
	//	.AsReusable()
		//.WithBroadcast()
		//.BoundToPort(8080)
		;
	//SenderSocket = ISocketSubsystem::Get()->CreateSocket(NAME_DGram, TEXT("default"), FName("IPv4"));
	//SenderSocket->SetReuseAddr();
	//SenderSocket->SetNonBlocking();
	//SenderSocket->SetBroadcast(true);
}
void UdpClient::exit()
{
	if (Sendreceivethread)
	{
		Sendreceivethread->StopThread();
	}
	if (Receivereceivethread)
	{
		Receivereceivethread->StopThread();
	}
	if (ReceiveSocket)
	{
		ReceiveSocket->Close();
	}
	if (SenderSocket)
	{
		SenderSocket->Close();
	}
	exitthread = true;
	delete this;
}

UdpClient::~UdpClient()
{
	
	if (Sendreceivethread)
	{
		delete Sendreceivethread;
	}
	if (Receivereceivethread)
	{
		delete Receivereceivethread;
	}
}
FString UdpClient::listen(int32 port)
{
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////// only work on windows
	ISocketSubsystem* SocketSubsystem = ISocketSubsystem::Get();
	TSharedRef<FInternetAddr> Addr = SocketSubsystem->GetLocalBindAddr(*GLog);
	Addr->SetPort(port);
	ReceiveSocket = ISocketSubsystem::Get()->CreateSocket(NAME_DGram, TEXT("default receive"), Addr->GetProtocolType());
	validport = SocketSubsystem->BindNextPort(ReceiveSocket, *Addr,1000,1);
	 //Bind to our listen port
	//if (!ReceiveSocket->Bind(*Addr))
	//{
	//	GEngine->AddOnScreenDebugMessage(-1, 1.0f, FColor::Yellow, FString::FromInt(1).Append(" bind failed"));
	//	ISocketSubsystem::Get()->DestroySocket(ReceiveSocket);
	//	ReceiveSocket = nullptr;
	//	UE_LOG(LogTemp, Warning, TEXT("Failed to bind to the listen port (%s) for LiveLink face AR receiving with error (%s)"),
	//		*Addr->ToString(true), ISocketSubsystem::Get()->GetSocketError());
	//	check(ReceiveSocket);
	//	return"";
	//}
	//else
	//{
	//	GEngine->AddOnScreenDebugMessage(-1, 1.0f, FColor::Yellow, FString::FromInt(1).Append(" bind ok"));
	//}
	//Async(EAsyncExecution::ThreadPool, [=]() {ReceiveReceiveWork(); }, nullptr);
	Receivereceivethread = new RunnableThreadx([=]() {
		uint32 BytesPending = 0;
		FPlatformProcess::Sleep(0.015);
		while (ReceiveSocket->HasPendingData(BytesPending))
		{
			ISocketSubsystem* SocketSubsystem = ISocketSubsystem::Get();
			TSharedRef<FInternetAddr> Sender = SocketSubsystem->CreateInternetAddr();
			RecvBuffer.Empty();
			RecvBuffer.AddUninitialized(BytesPending);
			int32 BytesRead = 0;
			if (ReceiveSocket->RecvFrom(RecvBuffer.GetData(), BytesPending, BytesRead, *Sender))
			{
				OnUdpServerReceiveddata.ExecuteIfBound(RecvBuffer);
			}
		}
	});
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		////only work on windows
	bool bCanBindAll;
	TSharedPtr<class FInternetAddr> Addr1 = ISocketSubsystem::Get(PLATFORM_SOCKETSUBSYSTEM)->GetLocalHostAddr(*GLog, bCanBindAll);
	FString MyIP = Addr1->ToString(false);
	GEngine->AddOnScreenDebugMessage(-1, 15.0f, FColor::Yellow, MyIP);
	return MyIP;

}
void UdpClient::setserveraddress(FString ipaddress, int32 port)
{
	bool bIsValid;
	RemoteAddr = ISocketSubsystem::Get(PLATFORM_SOCKETSUBSYSTEM)->CreateInternetAddr();
	RemoteAddr->SetIp(*ipaddress, bIsValid);
	RemoteAddr->SetPort(port);

	if (!bIsValid)
	{
		GEngine->AddOnScreenDebugMessage(-1, 1.0f, FColor::Yellow, TEXT("UDP Sender>> IP address was not valid!"));
		return;
	}
	protocoltype = RemoteAddr->GetProtocolType();
	SenderSocket = ISocketSubsystem::Get()->CreateSocket(NAME_DGram, TEXT("default send"), protocoltype /*FName("IPv4")*/);
	SenderSocket->SetReuseAddr();
	SenderSocket->SetNonBlocking();
	//SenderSocket->SetBroadcast();

	//int32 SendSize = 65507;
	//SenderSocket->SetSendBufferSize(SendSize, SendSize);
	//SenderSocket->SetReceiveBufferSize(SendSize, SendSize);
	//Async(EAsyncExecution::ThreadPool, [=]() {SendReceiveWork(); }, nullptr);
	Sendreceivethread = new RunnableThreadx([=]() {
		FPlatformProcess::Sleep(0.015);


		bool b = false;
		b = SenderSocket->HasPendingData(datasize);


		int32 bytes;
		if (b)
		{
			//UMyBlueprintFunctionLibrary::CLogtofile(FString(" Socket->HasPendingData(datasize) is ture"));
			// u need to ensure single package not bigger than 65536 byte
			// and the time gap between two packages is needed and at least 30ms 
			datareceive.Empty();
			datareceive.AddUninitialized(datasize);
			//SenderSocket->GetPeerAddress(*RemoteAddr.Get());
			SenderSocket->Recv(&datareceive[0], datasize, bytes, ESocketReceiveFlags::None);
			OnUdpClientReceiveddata.ExecuteIfBound(datareceive);

			/*
			#ifdef UTF16
						FString datatostring = FString(datareceive.Num() >> 1, (TCHAR*)&datareceive[0]);
						UMyBlueprintFunctionLibrary::CLogtofile(datatostring);
						OnUdpClientReceiveddata.ExecuteIfBound(datareceive, datatostring);
			#else
						FString datatostring = FString(UTF8_TO_TCHAR(&datareceive[0])).Left(datareceive.Num());
						OnUdpClientReceiveddata.ExecuteIfBound(datareceive, datatostring);
			#endif // SENDUTF16
			*/
		}
	});
}
bool UdpClient::Send(const FString& serialized)
{
	bool successful = false;
	int32 sent = 0;
	//uint8* pointer;
#ifdef UTF16
	//int64 outsize;
	//UMyBlueprintFunctionLibrary::FStringtoUTF16(serialized, pointer, outsize);
	//successful = Send(pointer, outsize);
#else
	const TCHAR* serializedChar = serialized.GetCharArray().GetData();
	int32 size = FCString::Strlen(serializedChar);
	//pointer = (uint8*)TCHAR_TO_UTF8(serializedChar);
	successful = Send((uint8*)TCHAR_TO_UTF8(serializedChar), size);
#endif // SENDUTF16
	return successful;
}
bool UdpClient::Send(const uint8* content, const int32& size)
{

	int32 BytesSent = 0;
	bool bs = SenderSocket->SendTo(content, size, BytesSent, *RemoteAddr);
	//GEngine->AddOnScreenDebugMessage(-1, 1.0f, FColor::Yellow, FString::FromInt(BytesSent));

	return bs;
}
//void UdpClient::SendReceiveWork()
//{
//	//UMyBlueprintFunctionLibrary::CLogtofile(FString("ReceiveWork() ok"));
//
//	while (true)
//	{
//		if (exitthread)
//		{
//			//UMyBlueprintFunctionLibrary::CLogtofile(FString("exitthread"));
//			SenderSocket->Close();
//			delete this;
//			break;
//		}
//		if (SenderSocket == nullptr)
//		{
//			//UMyBlueprintFunctionLibrary::CLogtofile(FString("Socket == nullptr"));
//			delete this;
//			break;
//		}
//		//GEngine->AddOnScreenDebugMessage(-1, 1.0f, FColor::Yellow, TEXT("UTcpClient threadworker"));
//		FPlatformProcess::Sleep(0.015);
//
//
//		bool b = false;
//		b = SenderSocket->HasPendingData(datasize);
//
//
//		int32 bytes;
//		if (b)
//		{
//			//UMyBlueprintFunctionLibrary::CLogtofile(FString(" Socket->HasPendingData(datasize) is ture"));
//			// u need to ensure single package not bigger than 65536 byte
//			// and the time gap between two packages is needed and at least 30ms 
//			datareceive.Empty();
//			datareceive.AddUninitialized(datasize);
//			//SenderSocket->GetPeerAddress(*RemoteAddr.Get());
//			SenderSocket->Recv(&datareceive[0], datasize, bytes, ESocketReceiveFlags::None);
//			OnUdpClientReceiveddata.ExecuteIfBound(datareceive);
//
//			/*
//			#ifdef UTF16
//						FString datatostring = FString(datareceive.Num() >> 1, (TCHAR*)&datareceive[0]);
//						UMyBlueprintFunctionLibrary::CLogtofile(datatostring);
//						OnUdpClientReceiveddata.ExecuteIfBound(datareceive, datatostring);
//			#else
//						FString datatostring = FString(UTF8_TO_TCHAR(&datareceive[0])).Left(datareceive.Num());
//						OnUdpClientReceiveddata.ExecuteIfBound(datareceive, datatostring);
//			#endif // SENDUTF16
//			*/
//		}
//	}
//}
//void UdpClient::ReceiveReceiveWork()
//{
//	while (true)
//	{
//		if (exitthread)
//		{
//			ReceiveSocket->Close();
//			break;
//		}
//		uint32 BytesPending = 0;
//		FPlatformProcess::Sleep(0.015);
//		while (ReceiveSocket->HasPendingData(BytesPending))
//		{
//			ISocketSubsystem* SocketSubsystem = ISocketSubsystem::Get();
//			TSharedRef<FInternetAddr> Sender = SocketSubsystem->CreateInternetAddr();
//			RecvBuffer.Empty();
//			RecvBuffer.AddUninitialized(BytesPending);
//			int32 BytesRead = 0;
//			if (ReceiveSocket->RecvFrom(RecvBuffer.GetData(), BytesPending, BytesRead, *Sender))
//			{
//				OnUdpServerReceiveddata.ExecuteIfBound(RecvBuffer);
//			}
//		}
//	}
//
//}