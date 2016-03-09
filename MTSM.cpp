// ConsoleApplication1.cpp : Defines the entry point for the console application.

#include <iostream>
#include "stdafx.h"
#include <stdlib.h>
#include <string>
#include <dirent.h>
#include <stdio.h>
#include <windows.h>

using namespace std;

int main()
{
	char* appdataENV;
	appdataENV = getenv("appdata");
	char* appdata;
	strcpy(appdata, "appdataENV");
	char* curseSetting;
	curseSetting = "C:/Users/" + appdata + "/AppData/Roaming/Curse Client/Minecraft.settings");
    return 0;
}