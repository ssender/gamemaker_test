/// @description Insert description here
// You can write your code in this editor

//variables
reset = function() 
{
	facing_left = false;
	on_ground = false;
	friction_power = 1;
	jump_buffer = 0;
	jump_extend = 0;
	leap_buffer = 0;
	vx = 0;
	vy = 0;
	walljumping = 0;
	walljump_leniency = 0;

	real_x = x;
	real_y = y;

	blocked_left = false;
	blocked_right = false;
	blocked_top = false;

	walk_sprite = 0;
	walk_cycle_stage = 0;
	walk_cycle_time = 0;

	have_leap = 0;
	leap_frames = 0;
}

reset();

initiate_death = false;
dead = false;
death_animation = 0;
respawn_x = 0;
respawn_y = 0;
camera_speed_save = 0;

respawn_delta = [0,0];

//physics constants
top_speed = 3.2;
terminal_velo = 6;
accel = 0.5;
decel = 0.3;
jump_power = 3.5;
buffer_frames = 6;
grav_power = 0.3;
walljump_power_x = 3;
walljump_mult_y = 0.5;
walljump_leniency_frames = 3;
leap_velo = 7;
leap_friction_immunity = 1.5;

walk_cycle_delay = 10;

hb_height = 32;
hb_width = 18;

//controls
control_setup = function()
{
	if global.controlsetup = 0
	{
		left_button = vk_left;
		right_button = vk_right;
		down_button = vk_down;
		jump_button = ord("C");	
		second_button = ord("X");
	}
	else
	{
		left_button = ord("A");
		right_button = ord ("D");
		down_button = ord("S");
		jump_button = ord("J");
		second_button = ord("K");
	}
}

control_setup();

