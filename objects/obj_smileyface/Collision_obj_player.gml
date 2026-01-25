if !collected
{
	sprite_index = spr_smiley_collect
	image_speed = 0.35
	alarm[0] = 150
	scr_sound_3d_pitched(sfx_collectbig, x, y)
	collected = true
}
