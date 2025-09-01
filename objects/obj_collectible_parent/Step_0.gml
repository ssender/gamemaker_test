/// @description Insert description here
// You can write your code in this editor

if obj_pausemanager.paused = false
{
	if state = 0
	{
		if obj_debug.debugmode = true
		{
			image_index = 10;
			animation = 20;
		}
		else
		{
			if animation = 20
			{
				image_index += 1;
				animation = 0;
			}
		
			if image_index = 4
			{
				image_index = 0;
			}
		
			animation += 1;
		
		}
	}
	else if state = 1
	{
		if animation = 6
		{
			image_index += 1;
			animation = 0;
		
			if image_index = 10
			{
				state = 2;
			}
		}
	
		animation += 1;
	}

	if state = 2
	{
		collect_item();
		instance_destroy();
	}
}


