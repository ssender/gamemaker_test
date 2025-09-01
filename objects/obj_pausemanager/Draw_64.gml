/// @description Insert description here
// You can write your code in this editor

if paused = true
{
	draw_set_font(fnt_big);
	draw_set_halign(fa_left);
	
	draw_sprite(spr_pauseui, 0, 0, 0);
	
	if menu_layer = 0
	{
		if option = 0
		{
			draw_text(160, 260, ">resume")
		}
		else
		{
			draw_text(160, 260, " resume")
		}
	
		if option = 1
		{
			draw_text(160, 260 + (spacing), ">options")
		}
		else
		{
			draw_text(160, 260 + (spacing), " options")
		}
	
		if option = 2
		{
			draw_text(160, 260 + (spacing * 2), ">quit")
		}
		else
		{
			draw_text(160, 260 + (spacing * 2), " quit")
		}
	}
	else if menu_layer = 1
	{
		if option = 0
		{
			draw_text(160, 260, ">controls")
		}
		else
		{
			draw_text(160, 260, " controls")
		}
	
		if option = 1
		{
			draw_text(160, 260 + (spacing), ">bgm")
		}
		else
		{
			draw_text(160, 260 + (spacing), " bgm")
		}
	
		if option = 2
		{
			draw_text(160, 260 + (spacing * 2), ">sfx")
		}
		else
		{
			draw_text(160, 260 + (spacing * 2), " sfx")
		}
		
		if option = 3
		{
			draw_text(160, 260 + (spacing * 3), ">back")
		}
		else
		{
			draw_text(160, 260 + (spacing * 3), " back")
		}
		
		var _text1 = "";
		
		if global.controlsetup = 0
		{
			_text1 = "ARROWS";
		}
		else
		{
			_text1 = "WASD"	;
		}
			
		if selected != 1
		{
			draw_text(370, 260, string_concat(" ", _text1));
		}
		else
		{
			draw_text(370, 260, string_concat(">", _text1, "<"));
		}
		
		var _text2 = string(global.bgm);
		
		if selected != 2
		{
			draw_text(370, 260 + spacing, string_concat(" ", _text2));
		}
		else
		{
			draw_text(370, 260 + spacing, string_concat(">", _text2, "<"));
		}
		
		var _text3 = string(global.sfx);
		
		if selected != 3
		{
			draw_text(370, 260 + (spacing * 2), string_concat(" ", _text3));
		}
		else
		{
			draw_text(370, 260 + (spacing * 2), string_concat(">", _text3, "<"));
		}
	}
	
	var _x = 0;
	
	if obj_scorekeeper.flower = true
	{
		draw_sprite(spr_collectible_display, 1, 170 + _x, 468);
	}
	else
	{
		draw_sprite(spr_collectible_display, 0, 170 + _x, 468);
	}
	
	_x += 74
	
	if obj_scorekeeper.melon = true
	{
		draw_sprite(spr_collectible_display, 2, 170 + _x, 468);
	}
	else
	{
		draw_sprite(spr_collectible_display, 0, 170 + _x, 468);
	}
	
	_x += 74
	
	if obj_scorekeeper.gemstone = true
	{
		draw_sprite(spr_collectible_display, 3, 170 + _x, 468);
	}
	else
	{
		draw_sprite(spr_collectible_display, 0, 170 + _x, 468);
	}
	
	_x += 74
	
	if obj_scorekeeper.water = true
	{
		draw_sprite(spr_collectible_display, 4, 170 + _x, 468);
	}
	else
	{
		draw_sprite(spr_collectible_display, 0, 170 + _x, 468);
	}
	
	_x += 74
	
	if obj_scorekeeper.moon = true
	{
		draw_sprite(spr_collectible_display, 5, 170 + _x, 468);
	}
	else
	{
		draw_sprite(spr_collectible_display, 0, 170 + _x, 468);
	}
	
	_x += 74
	
	if obj_scorekeeper.star = true
	{
		draw_sprite(spr_collectible_display, 6, 170 + _x, 468);
	}
	else
	{
		draw_sprite(spr_collectible_display, 0, 170 + _x, 468);
	}
	
}

if paused =  false
{
	selected = 0;
	menu_layer = 0;
}





