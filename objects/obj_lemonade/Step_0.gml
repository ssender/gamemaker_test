/// @description walk cycles
// You can write your code in this editor
if obj_pausemanager.paused = true
{
	control_setup();	
}

if obj_pausemanager.paused = false
{
	if initiate_death = true
	{
		initiate_death = false
		dead = true;
		death_animation = 0;
		audio_play_sound(snd_sfx_death, 1, false);
		camera_speed_save = obj_cameramanager.follow_speed;
		obj_cameramanager.follow_speed = 30;
	}

	if dead = false
		{
		//get inputs
		var _left = keyboard_check(left_button);
		var _right = keyboard_check(right_button);
		var _down = keyboard_check(down_button);
		var _second = keyboard_check_pressed(second_button);
		var _jump = keyboard_check_pressed(jump_button);

		//decerlate due to air friction on the x axis
		if leap_frames > 0
		{
			if leap_frames > 4
			{
				friction_power = 0
			}
			else
			{
				friction_power = 0.85 * leap_frames / 4
			}
		
			leap_frames -= 1;
		}
		else
		{
			if on_ground
			{
				friction_power = 1.5;
			}
			else
			{
				friction_power = 0.85;
			}
		}

		var _slowdownx = (vx * accel * friction_power)/(top_speed);

		if _slowdownx > 1
		{
			_slowdownx = 1
		}

		vx -= _slowdownx;

		if abs(vx) < 0.3 && !_left && !_right
		{
			vx = 0;
		}

		//decelerate due to friction on the y axis
		if vy >= 0
		{
			var _slowdowny = (vy * grav_power)/terminal_velo;
			vy -= _slowdowny;
		}

		//manage walljump status
		if vy >= 0.7
		{
			walljumping = 0;
		}


		//accelerate horizontally according to input
		if _left && !_right && walljumping != 1
		{
			vx -= accel * friction_power;
			facing_left = true;
		}

		if _right && !_left && walljumping != -1
		{
			vx += accel * friction_power;
			facing_left = false;
		}

		//manage buffered jump inputs
		if jump_buffer > 0
		{
			jump_buffer -= 1;
		}

		if _jump
		{
				jump_buffer = buffer_frames;
		}
		
		//manage buffered leap inputs
		if leap_buffer > 0
		{
			leap_buffer -= 1;
		}
		
		if _second
		{
			leap_buffer = buffer_frames;
		}

		//manage leap inputs
		if have_leap > 0 && leap_buffer > 0
		{
			if _left && !_right && on_ground
			{
				vy = -jump_power;
				
				if vx > -top_speed
				{
					vx = -top_speed -leap_velo;
				}
				else
				{
					vx += -leap_velo;
				}
				
				leap_frames = round(leap_friction_immunity * abs(vx));
				audio_play_sound(snd_sfx_dash, 2, false, global.sfx/100);
			}
			else if !_left && _right && on_ground
			{
				vy = -jump_power;
				
				if vx < top_speed
				{
					vx = +top_speed +leap_velo;
				}
				else
				{
					vx += leap_velo;
				}
				
				leap_frames = round(leap_friction_immunity * abs(vx));
				audio_play_sound(snd_sfx_dash, 2, false, global.sfx/100);
			}
			else 
			{
				vy = -leap_velo;
				leap_frames = round(leap_friction_immunity * abs(vx));
				audio_play_sound(snd_sfx_bigjump, 2, false, global.sfx/100);
			}
	
			walljumping = 0;
			have_leap = 0;
			jump_extend = 0;
			leap_buffer = 1;
		}


		//check for ground, manage jump inputs, add gravity
		var _semisolidchk = collision_line(x, y + hb_height, x + hb_width - 1, y + hb_height, obj_semisolid, false, true) != noone && vy >= 0;
	
		if collision_line(x, y + hb_height, x + hb_width - 1, y + hb_height, obj_ground, false, true) != noone || _semisolidchk
		{
			if jump_buffer > 0
			{
				vy = -jump_power;
				jump_buffer = 0;
				jump_extend = 12;
				audio_play_sound(snd_sfx_jump, 2, false, global.sfx/100);
			}
			else
			{
				if vy > 0
				{
					vy = 0;
					on_ground = true;	
					walk_cycle_time = walk_cycle_delay - 1;
				}
			}
		}
		else
		{
			on_ground = false;
	
			if jump_extend > 0 && keyboard_check(jump_button)
			{
				vy = -jump_power;
		
				if walljumping = 1
				{
					vx = walljump_power_x;
				}
				else if walljumping = -1
				{
					vx = -walljump_power_x;
				}
		
				jump_extend -= 1;
			}
			else
			{
				if _down
				{
					vy += grav_power * 1.8
				}
				else
				{
					vy += grav_power;
				}
		
				jump_extend = 0;

			}
		}

		//check on left for obstacles, manage walljumping
		if collision_line(x - 1, y, x - 1, y + hb_height - 1, obj_ground, false, true) != noone
		{
			if vx < 0
			{
				vx = 0;
			}
	
			walljump_leniency = walljump_leniency_frames;
			blocked_left = true;
		}
		else
		{
			blocked_left = false;
		}


		//check on right for obstacles, manage walljumping
		if collision_line(x + hb_width, y, x + hb_width, y + hb_height - 1, obj_ground, false, true) != noone
		{
			if vx > 0
			{
				vx = 0;
			}
	
			blocked_right = true;
			walljump_leniency = -walljump_leniency_frames;
		}
		else
		{
			blocked_right = false;
		}

		//manage walljumping
		if jump_buffer > 0 && abs(walljump_leniency) > 0
		{
			vy = -jump_power * walljump_mult_y;
			jump_buffer = 0;
			jump_extend = 12;
	
			audio_play_sound(snd_sfx_jump, 2, false, global.sfx/100);
	
			if sign(walljump_leniency) = 1
			{
				vx = walljump_power_x;
				walljumping = 1;
			}
			else
			{
				vx = -walljump_power_x;
				walljumping = -1;
			}
	
			walljump_leniency = 0;
		}

		if abs(walljump_leniency) > 0
		{
			walljump_leniency += -sign(walljump_leniency);
		}

		//check above head for obstacles
		if collision_line(x + 1, y - 1, x + hb_width - 1, y - 1, obj_ground, false, true) != noone
		{
			if vy < 0
			{
				vy = 0;
				jump_extend = 0;
			}
	
			blocked_top = true;
		}
		else
		{
			blocked_top = false;
		}

		//procedure for wall/floor/ceiling collisions
		var _mag = sqrt(sqr(vx) + sqr(vy));
		var _velo = [vx, vy];
		var _unitvelo = [0, 0];

		//loop for collision procedure
		for (var _i = 1; _i <= _mag; _i += 1)
		{
			_unitvelo[0] = vx/_mag;
			_unitvelo[1] = vy/_mag;
	
			var _newpos = [round(real_x + _unitvelo[0]), round(real_y + _unitvelo[1])];
	
			if collision_rectangle(_newpos[0], _newpos[1], _newpos[0] + hb_width, _newpos[1] + hb_height, obj_ground, false, true) != noone
			{
				break;
			}
			else if collision_line(_newpos[0], _newpos[1] + hb_height - 1, _newpos[0] + hb_width - 1, _newpos[1] + hb_height - 1, obj_semisolid, true, true) != noone && vy > 0
			{
				break;	
			}
			else
			{
				x = _newpos[0];
				y = _newpos[1];
				real_x += _unitvelo[0];
				real_y += _unitvelo[1];
			}
		}
	
	
		//move debug image
		if obj_debug.debugmode = true
		{
			obj_debug.x = x;
			obj_debug.y = y;
		}

		//sprite management
		if (_left ^^ _right) && on_ground
		{
			walk_cycle_time += 1;
	
			if walk_cycle_time = walk_cycle_delay
			{
				walk_cycle_time = 1;
		
				if walk_cycle_stage = 3
				{
					walk_cycle_stage = 0;
				}
				else
				{
					walk_cycle_stage += 1;
				}
			}
	
			if walk_cycle_stage = 3
			{
				walk_sprite = 1;
			}
			else
			{
				walk_sprite = walk_cycle_stage
			}
	
		}

		if vx = 0 && on_ground
		{
			walk_sprite = 1;
		}

		if facing_left = true
		{
			image_index = 0 + walk_sprite + (have_leap * 6);
		}
		else
		{
			image_index = 3 + walk_sprite + (have_leap * 6);
		}
		
		if !on_ground
		{
			if facing_left
			{
				image_index = 15 + (have_leap * 2);
			}
			else
			{
				image_index = 14 + (have_leap * 2);
			}
		}

	}

	if dead = true
	{
		if death_animation < 1
		{
			if facing_left = true
			{
				image_index = 12;
			}
			else
			{
				image_index = 13;
			}
		}
		else if death_animation < 20
		{
			y += (death_animation - 11)/2
		}
		else if death_animation = 20
		{
			respawn_delta[0] = respawn_x - x;
			respawn_delta[1] = respawn_y - y;
		}
		else if death_animation > 20 && death_animation < 61
		{
			image_alpha = 0.4
			x += respawn_delta[0]/40;
			y += respawn_delta[1]/40;
		}
		else if death_animation = 61
		{
			dead = false;
			x = round(x);
			y = round(y);
			image_alpha = 1;
			obj_cameramanager.follow_speed = camera_speed_save;
			reset();
		}
		death_animation += 1;
	}
}

