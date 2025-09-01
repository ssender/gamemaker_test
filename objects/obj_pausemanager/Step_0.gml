/// @description Insert description here
// You can write your code in this editor

if paused
{
	var _left = vk_left;
	var _right = vk_right;
	var _up = vk_up;
	var _down = vk_down;
	var _confirm = ord("C");
	var _back = ord("X");
	
	if global.controlsetup = 1
	{
		_left = ord("A");
		_right = ord("D")
		_up = ord("W");
		_down = ord("S");
		_confirm = ord("J");
		_back = ord("K");
	}
	
	var _choices = 3;
	
	if menu_layer = 1
	{
		_choices = 4;
	}
	
	
	if keyboard_check_pressed(_up)
	{
		if selected = 0
		{
			option -= 1;
			if option = -1
			{
				option = _choices - 1;
			}
		}
		else if selected = 1
		{
			control_change();
		}
		else if selected = 2
		{
			bgm_change(10);
		}
		else if selected = 3
		{
			sfx_change(10);
		}
			
	}
	
	if keyboard_check_pressed(_down)
	{
		if selected = 0
		{
			option += 1;
			if option = _choices
			{
				option = 0;
			}
		}
		else if selected = 1
		{
			control_change();
		}
		else if selected = 2
		{
			bgm_change(-10);
		}
		else if selected = 3
		{
			sfx_change(-10);
		}
	}
	
	if keyboard_check_pressed(_left)
	{
		if selected = 1
		{
			control_change();
		}
		else if selected = 2
		{
			bgm_change(-10);
		}
		else if selected = 3
		{
			sfx_change(-10);
		}	
	}
	
	if keyboard_check_pressed(_right)
	{
		if selected = 1
		{
			control_change();
		}
		else if selected = 2
		{
			bgm_change(10);
		}
		else if selected = 3
		{
			sfx_change(10);
		}	
	}
	
	if keyboard_check_pressed(_confirm)
	{
		if menu_layer = 0
		{
			if option = 0
			{
				paused = false;
				save_prefs();
			}
			else if option = 1
			{
				menu_layer = 1;
				option = 0;
			}
			else if option = 2
			{
				room_goto(rm_mainmenu);
				audio_stop_all();
			}
		}
		else if menu_layer = 1 && selected = 0
		{
			if option = 0
			{
				selected = 1;
			}
			else if option = 1
			{
				selected = 2;
			}
			else if option = 2
			{
				selected = 3;
			}
			else if option = 3
			{
				menu_layer = 0;
				option = 1;
			}
		}
		else if selected != 0
		{
			selected = 0;	
		}
	}
	
	if keyboard_check_pressed(_back)
	{
		if selected != 0 
		{
			selected = 0;
		}
		else if menu_layer = 1
		{
			menu_layer = 0;	
		}
		else if menu_layer = 0
		{
			paused = false;
			save_prefs();
		}
	}

}








