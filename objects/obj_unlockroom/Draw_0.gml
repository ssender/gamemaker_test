/// @description Insert description here
// You can write your code in this editor

draw_self();

if obj_scorekeeper.melon
{
	draw_sprite(spr_unlock_display, 0, x, y);
}

if obj_scorekeeper.gemstone
{
	draw_sprite(spr_unlock_display, 1, x, y + 48);
}

if obj_scorekeeper.flower
{
	draw_sprite(spr_unlock_display, 2, x, y + 96);
}

if obj_scorekeeper.star
{
	draw_sprite(spr_unlock_display, 3, x + 96, y);
}

if obj_scorekeeper.moon
{
	draw_sprite(spr_unlock_display, 4, x + 96, y + 48);
}

if obj_scorekeeper.water
{
	draw_sprite(spr_unlock_display, 5, x + 96, y + 96);
}

if unlocked
{
	draw_sprite(spr_unlock_platform, 0, x + 48, y);
	draw_sprite(spr_unlock_platform, 0, x + 48, y + 48);
	draw_sprite(spr_unlock_platform, 0, x + 48, y + 96);
}







