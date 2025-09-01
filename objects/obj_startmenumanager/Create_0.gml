/// @description Insert description here
// You can write your code in this editor

page = 0;
selection = 0;

if file_exists("game_data.ini")
{
	ini_open("game_data.ini")
	global.controlsetup = ini_read_real("prefs", "control", 0);
	global.sfx = ini_read_real("prefs", "sfx", 50);
	global.bgm = ini_read_real("prefs", "bgm", 50);

}
else
{
	global.controlsetup = 0;
	global.bgm = 50;
	global.sfx = 50;

}

global.speedruntimer = false;
global.splits = false;
/*
startmenu pages 
0 newgame, continue
1 control setup
2 file select






