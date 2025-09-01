/// @description Insert description here
// You can write your code in this editor

frames = 0;
centi = 0;
seconds = 0;
minutes = 0;
total_frames = 0;

game_running = true;

flower = false;
melon = false;
gemstone = false;
moon = false;
star = false;
water = false;

split_names = ["Item 1", "Item 2", "Item 3", "Trapdoor", "Item 4", "Item 5", "Item 6", "Backtrack", "Clifftop", "Cookies"];
split_times = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
comps = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
deltas = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
comparing = false;
current_split = 0;

spacing = 26;

function convert_time(_input, _format)
{
	var _frames = abs(_input);
	var _sign = sign(_input);
	var _minute = floor(_frames/3600);
	var _second = floor((_frames - (_minute * 3600))/60);
	var _tenths = floor((_frames - (_second * 60) - (_minute * 3600))/6);
	
	if _format = 0
	{
		var _secdisp = string(_second);
		if _second < 10
		{
			_secdisp = string_concat("0", _secdisp);
		}
		
		return string_concat(_minute, ":", _secdisp);
	}
	else if _format = 1
	{
		var _dir = "+";
		if _sign = -1
		{
			_dir = "-";
		}
		
		var _mindisp = string_concat(string(_minute), ":");
		if _minute = 0
		{
			_mindisp = "";
		}
		
		var _secdisp = string(_second);
		
		if _second < 10 && _minute != 0
		{
			_secdisp = string_concat("0", _secdisp);
		}
		
		return string_concat(_dir, _mindisp, _secdisp, ".", string(_tenths));
	}
	else if _format = 2
	{
		var _secdisp = string(_second);
		if _second < 10
		{
			_secdisp = string_concat("0", _secdisp);
		}
		
		return string_concat(_minute, ":", _secdisp, ".", _tenths);
	}
}

function draw_info_line(_splitindex, _x, _y)
{
	draw_set_halign(fa_left);
	draw_text(_x, _y, split_names[_splitindex]);
	
	draw_set_halign(fa_center);
	if comparing
	{
		var _deltadisplay = "-";
		
		if current_split > _splitindex || deltas[_splitindex] >= 0 || !game_running
		{
			_deltadisplay = convert_time(deltas[_splitindex], 1);
		}
		
		draw_text(_x + 160, _y, _deltadisplay);
		
		if split_times[current_split] < comps[current_split] && current_split = _splitindex && game_running
		{
			draw_text(_x + 260, _y, convert_time(comps[_splitindex], 0));
		}
		else
		{
			draw_text(_x + 260, _y, convert_time(split_times[_splitindex], 0));
		}
	}
	else
	{
		draw_text(_x + 160, _y, "-");
		draw_text(_x + 260, _y, convert_time(split_times[_splitindex], 0));
	}
	
}

//formats: 0 = standard full time (no decimal), 1 = delta, 2 = with decimal

if file_exists("splits.ini")
{
	ini_open("splits.ini");
	comps[0] = ini_read_real("times", "Item 1", 0);
	comps[1] = ini_read_real("times", "Item 2", 0);
	comps[2] = ini_read_real("times", "Item 3", 0);
	comps[3] = ini_read_real("times", "Trapdoor", 0);
	comps[4] = ini_read_real("times", "Item 4", 0);
	comps[5] = ini_read_real("times", "Item 5", 0);
	comps[6] = ini_read_real("times", "Item 6", 0);
	comps[7] = ini_read_real("times", "Backtrack", 0);
	comps[8] = ini_read_real("times", "Clifftop", 0);
	comps[9] = ini_read_real("times", "Cookies", 0);
	
	ini_close();
	
	comparing = true;
}

