/// @description Insert description here
// You can write your code in this editor

if obj_lemonade.dead = false
{
	if image_angle = 0 && obj_lemonade.vy >= 0
	{
		obj_lemonade.initiate_death = true;
	}
	else if image_angle = 180 && obj_lemonade.vy <= 0
	{
		obj_lemonade.initiate_death = true;
	}
	else if image_angle = 90 && obj_lemonade.vx >= 0
	{
		obj_lemonade.initiate_death = true;
	}
	else if image_angle = 270 && obj_lemonade.vx <= 0
	{
		obj_lemonade.initiate_death = true;
	}
}




