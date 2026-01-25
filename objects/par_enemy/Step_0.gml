if escape_frozen
{
	visible = false
	
	if (distance_to_object(obj_player) <= 5000 && alarm[1] == -1 && global.panic.active)
	{
		create_effect(x, y - 20, spr_pillarenemyspawner)
		alarm[1] = 22
	}
	
	exit;
}

do_enemy_generics()
collide()

if global.panic.active
{
	instance_destroy()
	
	audio_stop_sound(sfx_explosion)
	audio_stop_sound(sfx_punch)
	audio_stop_sound(sfx_punch1)
	audio_stop_sound(sfx_punch2)
	audio_stop_sound(sfx_punch3)
	audio_stop_sound(sfx_punch4)
	audio_stop_sound(sfx_punch5)
}