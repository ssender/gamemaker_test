/// @description Insert description here
// You can write your code in this editor

if obj_lemonade.dead = false && state = 0
{
		state = 1;
		animation = 0;
		image_index = 4;
		audio_play_sound(snd_sfx_collect, 1, false, global.sfx/100);
		obj_scorekeeper.current_split += 1;
}






