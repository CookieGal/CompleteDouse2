function player_mach2() 
{
	hsp = xscale * movespeed
	
	if (grounded && vsp >= 0)
	{
		sprite_index = spr_player_mach1
		image_speed = 0.35
		
		movespeed = 1
		
		if anim_ended()
		{
			if grounded
			{
				sprite_index = spr_player_mach3
				state = states.mach3
				movespeed = 9
			}
		}
		
		if (grounded && scr_hitwall(x + xscale, y))
		{
			state = states.bump
			reset_anim(spr_player_wallsplat)
			scr_sound_3d(sfx_splat, x, y)
		}
	}
}