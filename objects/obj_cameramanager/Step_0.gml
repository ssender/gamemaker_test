/// @description Insert description here
// You can write your code in this editor

if obj_pausemanager.paused = false
{
	var _x = camera_get_view_x(view_camera[0]);
	var _y = camera_get_view_y(view_camera[0]);

	if follow_mode = 1
	{
		target_x = obj_lemonade.x - horizontal_pad;
	
		if target_x < rail_start
		{
			target_x = rail_start;
		}
		else if target_x > rail_end
		{
			target_x = rail_end;
		}
	
		target_y = rail;
	
	}
	else if follow_mode = 2
	{
		target_x = obj_lemonade.x - screen_width + horizontal_pad;
	
		if target_x < rail_start
		{
			target_x = rail_start;
		}
		else if target_x > rail_end
		{
			target_x = rail_end;
		}
	
		target_y = rail;
	
	}
	if follow_mode = 3
	{
		target_x = rail;
	
		target_y = obj_lemonade.y - vertical_pad;
	
		if target_y < rail_start
		{
			target_y = rail_start;
		}
		else if target_y > rail_end
		{
			target_y = rail_end;
		}
	
	}
	else if follow_mode = 4
	{
		target_x = rail;
	
		target_y = obj_lemonade.y - screen_height + vertical_pad;
	
		if target_y < rail_start
		{
			target_y = rail_start;
		}
		else if target_y > rail_end
		{
			target_y = rail_end;
		}
	
	}
	else if follow_mode = 5
	{
		target_x = obj_lemonade.x - horizontal_pad;
		target_y = obj_lemonade.y - screen_height + vertical_pad;
	}

	var _delta = [target_x - _x, target_y - _y];
	var _mag = sqrt(sqr(_delta[0]) + sqr(_delta[1]));
	
	if real_follow_speed < _mag * 2
	{
		real_follow_speed = _mag/7;
	}
	
	if real_follow_speed > follow_speed
	{
		if obj_lemonade.vy > follow_speed
		{
			real_follow_speed = obj_lemonade.vy
		}
		else
		{
			real_follow_speed = follow_speed;
		}
	}
	else if real_follow_speed < 0.3
	{
		real_follow_speed = 0.3;
	}
	
	

	if _mag < real_follow_speed
	{
		_x = target_x;
		_y = target_y;
	}
	else
	{
		_x += real_follow_speed * _delta[0]/_mag;
		_y += real_follow_speed * _delta[1]/_mag;
	}



	if _x < 0
	{
		_x = 0
	}
	else if _x + screen_width >= room_width
	{
		_x = room_width - screen_width;
	}

	if _y < 0
	{
		_y = 0
	}
	else if _y + screen_height >= room_height
	{
		_y = room_height - screen_height;
	}

	camera_set_view_pos(view_camera[0], round(_x), round(_y));
}

