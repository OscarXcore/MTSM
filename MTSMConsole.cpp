#include "stdafx.h"
#include <string>
#include <stdio>
#include <iostream>

int main()
{
  char* appdataENV = getenv("APPDATA");
  strcpy (appdata, "appdataENV", 255);
  char* curseSettings;
  curseSettings = appdata + "/Curse Client/Minecraft.settings";
}
