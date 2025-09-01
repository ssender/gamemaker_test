/// @description Insert description here
// You can write your code in this editor

draw_set_alpha(1);

if global.speedruntimer 
{
	var _num = (minutes - (minutes % 10))/10;
	draw_sprite(spr_big_digits, _num, 22, 10);

	_num = (minutes % 10);
	draw_sprite(spr_big_digits, _num, 54, 10);

	_num = (seconds - (seconds % 10))/10;
	draw_sprite(spr_big_digits, _num, 100, 10);

	_num = (seconds % 10);
	draw_sprite(spr_big_digits, _num, 132, 10);
	
	centi = round((frames/60)*100);
	
	var _dec = centi;
	_num = (_dec - (_dec%10))/10;
	draw_sprite(spr_small_digits, _num, 172, 10);
		
	if game_running = false
	{
		_num = _dec%10;
		draw_sprite(spr_small_digits, _num, 192, 10);
	}
}

draw_set_alpha(0.6);
draw_set_font(fnt_bold);	
draw_set_halign(fa_left);

if global.splits
{
	if game_running
	{
		draw_set_alpha(0.6);


		if current_split !=0
		{
			draw_info_line(current_split - 1, 22, 64);
		}

		draw_info_line(current_split, 22, 64 + spacing);
	}
	else
	{
		draw_set_alpha(0.8);
	

		for (var _i = 0; _i < 10; _i += 1;)
		{
			draw_info_line(_i, 22, 64 + (spacing * _i));
		}
	}
}

draw_set_alpha(1);
