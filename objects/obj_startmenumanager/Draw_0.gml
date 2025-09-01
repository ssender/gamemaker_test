/// @description Insert description here
// You can write your code in this editor

draw_set_font(fnt_default);

draw_set_color(#091700);

draw_set_halign(fa_left);

if page = 0
{
	draw_text(170, 220, ">NEW GAME")
	
	if global.speedruntimer
	{
		if global.splits
		{
			draw_text(2, 2, "SPEEDRUN TIMER: ADVANCED");
		}
		else
		{
			draw_text(2, 2, "SPEEDRUN TIMER: BASIC");
		}
	}
}

draw_set_halign(fa_center);

if page = 1
{
	if selection = 0
	{
		draw_text(96, 200, "PRESS C");
		draw_text(288, 200, "PRESS J");
	}
	else if selection = 1
	{
		draw_text(96, 200, "CONFIRM (C)");
		draw_text(288, 200, "PRESS J");
	}
	else if selection = -1
	{
		draw_text(96, 200, "PRESS C");
		draw_text(288, 200, "CONFIRM (J)");
	}
}





