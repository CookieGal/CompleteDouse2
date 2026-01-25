if global.panic.active
{
	instance_destroy()
	
	audio_stop_sound(sfx_collectbig)
	audio_stop_sound(sfx_voice3)
	audio_stop_sound(sfx_voice4)
}
