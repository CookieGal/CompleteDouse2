if ds_list_find_index(global.ds_saveroom, id) != -1
	exit;

var p_id = instance_create(x, y, obj_enemycorpse)

with p_id
{
	sprite_index = spr_pillar_dead
	image_xscale = other.image_xscale
}

global.panic.active = true
global.panic.timer = 50000
global.panic.timer_max = 5000
global.doorshut = false

if instance_exists(obj_panictimer)
{
	with (obj_panictimer)
		visible = false
}

scr_sound(sfx_killenemy)
scr_sound(sfx_pillarimpact)

instance_create(x, y, obj_pillarflash)

obj_player.supertauntcount++

ds_list_add(global.ds_saveroom, id)