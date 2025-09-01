
if obj_lemonade.dead = false
{
	if target_mode != 6
	{
		obj_cameramanager.follow_mode = target_mode;
	}
	obj_cameramanager.rail = target_rail;
	obj_cameramanager.follow_speed = follow_speed;
	obj_cameramanager.rail_start = target_start;
	obj_cameramanager.rail_end = target_end;

	if target_mode = 0
	{
		obj_cameramanager.target_x = target_x;
		obj_cameramanager.target_y = target_y;
	}
}



