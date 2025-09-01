/// @description Insert description here
// You can write your code in this editor

var _a = obj_scorekeeper.flower;
var _b = obj_scorekeeper.melon;
var _c = obj_scorekeeper.gemstone;
var _d = obj_scorekeeper.water;
var _e = obj_scorekeeper.moon;
var _f = obj_scorekeeper.star;

if _a && _b && _c && _d && _e && _f && !unlocked
{
	unlocked = true;
	instance_create_layer(x + 48, y, "inst_map", obj_semisolid);
	instance_create_layer(x + 72, y, "inst_map", obj_semisolid);
	instance_create_layer(x + 48, y + 48, "inst_map", obj_semisolid);
	instance_create_layer(x + 72, y + 48, "inst_map", obj_semisolid);
	instance_create_layer(x + 48, y + 96, "inst_map", obj_semisolid);
	instance_create_layer(x + 72, y + 96, "inst_map", obj_semisolid);
}








