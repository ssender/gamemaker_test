/// @description Insert description here
// You can write your code in this editor

if obj_lemonade.dead = false
{
	obj_cameramanager.follow_mode = target_mode;
	obj_cameramanager.rail = target_rail;
	obj_cameramanager.follow_speed = camera_speed;

	if target_mode = 0
	{
		obj_cameramanager.target_x = target_x;
		obj_cameramanager.target_y = target_y;
	}

}



