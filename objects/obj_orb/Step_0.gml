/// @description Insert description here
// You can write your code in this editor

if obj_pausemanager.paused = false
{
	if obj_debug.debugmode && !debug
	{
		debug = true;
	}

	if !obj_debug.debugmode && debug
	{
		debug = false;
		image_index = 0;
	}

	

	if recharge = 120
	{
		animation += 1;
	
		if debug = true
		{
			image_index = 8;
		}
		else if animation = 20
		{
			if image_index = 3
			{
				image_index = 0;
			}
			else 
			{ 
				image_index += 1;
			}
		
			animation = 0;
		}
	}

	if recharge < 120
	{
		recharge += 1;
	
		if recharge < 30
		{
			image_index = 4;
		}
		else if recharge < 60
		{
			image_index = 5;
		}
		else if recharge < 90
		{
			image_index = 6;
		}
		else if recharge < 120
		{
			image_index = 7;
		}
		else if recharge = 120
		{
			image_index = 0;
			animation = 0;
		}
	}
}




