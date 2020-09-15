// Fill out your copyright notice in the Description page of Project Settings.


#include "staticLibrary.h"
#include "StaticLib1.h"

int UstaticLibrary::libte(int a)
{
	return fnStaticLib1(a);
}
bool UstaticLibrary::isportopenfromlib(int port, bool btcp)
{
	return isportopen(port,  btcp);
}
