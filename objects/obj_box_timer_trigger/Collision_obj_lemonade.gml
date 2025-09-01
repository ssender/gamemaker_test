/// @description Insert description here
// You can write your code in this editor

if obj_lemonade.dead = false && obj_scorekeeper.game_running = true
{
	obj_scorekeeper.game_running = false
	
	ini_open("splits.ini")
	var _pb = ini_read_real("times", "Cookies", -1);
	
	if obj_scorekeeper.split_times[9] < _pb || _pb = -1
	{
		ini_write_real("times", "Item 1", obj_scorekeeper.split_times[0]);
		ini_write_real("times", "Item 2", obj_scorekeeper.split_times[1]);
		ini_write_real("times", "Item 3", obj_scorekeeper.split_times[2]);
		ini_write_real("times", "Trapdoor", obj_scorekeeper.split_times[3]);
		ini_write_real("times", "Item 4", obj_scorekeeper.split_times[4]);
		ini_write_real("times", "Item 5", obj_scorekeeper.split_times[5]);
		ini_write_real("times", "Item 6", obj_scorekeeper.split_times[6]);
		ini_write_real("times", "Backtrack", obj_scorekeeper.split_times[7]);
		ini_write_real("times", "Clifftop", obj_scorekeeper.split_times[8]);
		ini_write_real("times", "Cookies", obj_scorekeeper.split_times[9]);
	}
	
	ini_close();
}








