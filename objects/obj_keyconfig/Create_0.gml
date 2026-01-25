depth = -200
binds = [ 
	{input: global.keybinds.left,		image_index: 3,		name: "LEFT",		globalname: "left"},
	{input: global.keybinds.right,		image_index: 2,		name: "RIGHT",		globalname: "right"},
	{input: global.keybinds.up,			image_index: 0,		name: "UP",			globalname: "up"},
	{input: global.keybinds.down,		image_index: 1,		name: "DOWN",		globalname: "down"},
	{input: global.keybinds.jump,		image_index: 4,		name: "JUMP",		globalname: "jump"},
	{input: global.keybinds.grab,		image_index: 5,		name: "ATTACK",		globalname: "grab"},
	{input: global.keybinds.dash,		image_index: 6,		name: "DASH",		globalname: "dash"},
	{input: global.keybinds.ui_left,	image_index: 3,		name: "MENU LEFT",	globalname: "ui_left"},
	{input: global.keybinds.ui_right,	image_index: 2,		name: "MENU RIGHT",	globalname: "ui_right"},
	{input: global.keybinds.ui_up,		image_index: 0,		name: "MENU UP",	globalname: "ui_up"},
	{input: global.keybinds.ui_down,	image_index: 1,		name: "MENU DOWN",	globalname: "ui_down"},
	{input: global.keybinds.ui_accept,	image_index: 7,		name: "ACCEPT",		globalname: "ui_accept"},
	{input: global.keybinds.ui_deny,	image_index: 8,		name: "LEAVE",		globalname: "ui_deny"}
] //dont mind these warnings

c_x = 0
offset = 0
selected = 0
binding = false

if instance_exists(obj_pause)
{
	audio_pause_sound(mu_pause)
	scr_sound(mu_options, true)
}

//have to hardcode this so there's an order
