// Copyright 1998-2019 Epic Games, Inc. All Rights Reserved.

using System.IO;
using System.Reflection;
using UnrealBuildTool;

public class staticliabwin : ModuleRules
{
	public staticliabwin(ReadOnlyTargetRules Target) : base(Target)
	{
		PCHUsage = ModuleRules.PCHUsageMode.UseExplicitOrSharedPCHs;
		
		PublicIncludePaths.AddRange(
			new string[] {
				// ... add public include paths required here ...
			}
			);
				
		
		PrivateIncludePaths.AddRange(
			new string[] {
				// ... add other private include paths required here ...
			}
			);
			
		
		PublicDependencyModuleNames.AddRange(
			new string[]
			{
				"Core",
				// ... add other public dependencies that you statically link with here ...
			}
			);
			
		
		PrivateDependencyModuleNames.AddRange(
			new string[]
			{
				"CoreUObject",
				"Engine",
				"Slate",
				"SlateCore",
				// ... add private dependencies that you statically link with here ...	
			}
			);
		
		
		DynamicallyLoadedModuleNames.AddRange(
			new string[]
			{
				// ... add any modules that your module loads dynamically here ...
			}
			);
		

		if (Target.Platform == UnrealTargetPlatform.Win64)
		{
			PrivateIncludePaths.Add("staticliabwin/TirdParty/Win64/include");
			var externalLib = Path.Combine(ModuleDirectory, "TirdParty/Win64"); 
			PublicAdditionalLibraries.Add(Path.Combine(externalLib, "StaticLib1.lib"));
		}
	}
}
