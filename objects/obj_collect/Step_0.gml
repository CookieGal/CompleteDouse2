if follow
{
	move_towards_point(obj_player.x, obj_player.y, movespeed);
	movespeed++;
}
else if distance_to_object(obj_player) < 25
	follow = true;

if global.panic.active
{
	instance_destroy()
	
	audio_stop_sound(sfx_collect)
	audio_stop_sound(sfx_collect2)
	audio_stop_sound(sfx_collect3)
}
