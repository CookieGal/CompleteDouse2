with (obj_player)
{
	state = states.actor
	hsp = 0
	vsp = 0
	
	room_goto(rm_oiflipposight)
	global.secret = false
	if obj_music.mu != noone
		audio_stop_sound(obj_music.mu)
	if obj_music.secret_mu != noone
		audio_stop_sound(obj_music.secret_mu)
	scr_sound(sfx_static)
}
