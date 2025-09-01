/// @description Insert description here
// You can write your code in this editor

draw_self();

if obj_scorekeeper.flower
{
	draw_sprite(spr_displaygems, 0, x, y)
}

if obj_scorekeeper.melon
{
	draw_sprite(spr_displaygems, 1, x + 24, y)
}

if obj_scorekeeper.gemstone
{
	draw_sprite(spr_displaygems, 2, x + 48, y)
}

if obj_scorekeeper.flower && obj_scorekeeper.melon && obj_scorekeeper.gemstone && !unlocked
{
	instance_destroy(obj_barrier);
	var _target = instance_nearest(3072, 1152, obj_semisolid);
	instance_destroy(_target);
	unlocked = true;
}




