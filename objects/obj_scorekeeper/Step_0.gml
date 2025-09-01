/// @description Insert description here
// You can write your code in this editor

if game_running = true
{
	frames += 1;
	total_frames += 1;
	
	if frames = 60
	{
		seconds += 1;
		frames = 0;
	}
	
	if seconds = 60
	{
		minutes += 1;
		seconds = 0;
	}
	
	split_times[current_split] = total_frames;
	
	if comparing
	{
		for (var _i = 0; _i < 10; _i += 1;)
		{
			deltas[_i] = split_times[_i] - comps[_i];
		}
	}
}








