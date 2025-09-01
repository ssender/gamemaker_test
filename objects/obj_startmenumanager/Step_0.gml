/// @description Insert description here
// You can write your code in this editor


if page = 1
{
	if keyboard_check_pressed(ord("C"))
	{
		if selection < 1
		{
			selection = 1;
		}
		else if selection = 1
		{
			global.controlsetup = 0;	
			room_goto(rm_main);
		}
	}
	
	if keyboard_check_pressed(ord("J"))
	{
		if selection > -1
		{
			selection = -1;
		}
		else if selection = -1
		{
			global.controlsetup = 1;	
			room_goto(rm_main);
		}
	}
}

if keyboard_check_pressed(vk_anykey) && page = 0 && !keyboard_check_pressed(vk_f5)
{
	page = 1
	selection = 0;
	var _layid = layer_get_id("Background");
	var _backid = layer_background_get_id(_layid);
	layer_background_sprite(_backid, spr_menu1); 
	
	instance_create_layer(22, 72, "Instances", obj_startmenucona);
	instance_create_layer(216, 72, "Instances", obj_startmenuconb);
}

if keyboard_check_pressed(vk_f5) && page = 0
{
	if global.speedruntimer && global.splits
	{
		global.speedruntimer = false;
		global.splits = false;
	}
	else if global.speedruntimer && !global.splits
	{
		global.splits = true;	
	}
	else
	{
		global.speedruntimer = true;
	}
	
}






