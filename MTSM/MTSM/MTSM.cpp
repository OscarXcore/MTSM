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

int initial()
{
	char *envAppdata = getenv("APPDATA");

	std::string mcSettings = "\\Curse Client\\Minecraft.settings";

	auto curseSettings = envAppdata + mcSettings;

	cout << curseSettings << "\n";
	return 0;
}

int packFind()
{
	return 0;
}

int main()
{
	initial();

	packFind();

	system("PAUSE");
	return 0;
}