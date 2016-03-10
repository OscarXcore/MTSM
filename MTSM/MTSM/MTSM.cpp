// MTSM.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>
#include <stdio.h>
#include <dirent.h>
#include <string>
#include <processenv.h>
#include <stdlib.h>

using namespace std;
using std::cout;

int main()
{
	DWORD bufferSize = 65535;
	std::wstring buff;
	buff.resize(bufferSize);
	bufferSize = GetEnvironmentVariableW(L"appdata", &buff[0], bufferSize);
	if (!bufferSize)
		//error
		buff.resize(bufferSize);

	std::string mcSettings = "/Curse Client/Minecraft.settings";
	auto curseSettings = to_string(bufferSize) + mcSettings;
	cout << curseSettings;
	return 0;
}