
if obj_lemonade.have_leap = false && obj_lemonade.dead = false && recharge = 120
{
	obj_lemonade.have_leap = true;
	audio_play_sound(snd_sfx_powerup, 1, false, global.sfx/100);
	recharge = 0;
}
