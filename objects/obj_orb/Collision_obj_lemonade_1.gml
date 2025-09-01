/// @description Insert description here
// You can write your code in this editor

if recharge = 120 && obj_lemonade.dead = false
{
	if obj_lemonade.have_leap = 0
	{
		obj_lemonade.have_leap = 1;
		recharge = 0;
		audio_play_sound(snd_sfx_powerup, 2, false);
	}
}




