/// @description Insert description here
// You can write your code in this editor

paused = false;
option = 0;
menu_layer = 0;
selected = 0;

spacing = 32;

control_change = function()
{
	if global.controlsetup = 0
	{
		global.controlsetup = 1;
	}
	else
	{
		global.controlsetup = 0;
	}
}

bgm_change = function(_amount)
{
	global.bgm += _amount
	
	if global.bgm < 0
	{
		global.bgm = 0;
	}
	else if global.bgm > 100
	{
		global.bgm = 100;
	}
}

sfx_change = function(_amount)
{
	global.sfx += _amount
	
	if global.sfx < 0
	{
		global.sfx = 0;
	}
	else if global.sfx > 100
	{
		global.sfx = 100;
	}
}

save_prefs = function()
{
	ini_open("game_data.ini");
	ini_write_real("prefs", "bgm", global.bgm);
	ini_write_real("prefs", "sfx", global.sfx);
	ini_write_real("prefs", "control", global.controlsetup);
	ini_close();
}




