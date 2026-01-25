function player_grab() 
{
	hsp = xscale * movespeed
	
	if (movespeed < 10)
	{
		movespeed += 0.1
	}
	
	if (!key_jump.down && !jumpstop && vsp < 1)
	{
		vsp /= 25
		jumpstop = true
	}
	
	if (input_buffers.jump > 0 && !key_down.down && coyote_time)
	{
		input_buffers.jump = 0
		jumpstop = false
		vsp = -11
		state = states.mach2
		reset_anim(spr_player_longjump)
		scr_sound_3d_on(myemitter, sfx_rollgetup)
		particle_create(x, y, particles.genericpoof, xscale, 1, spr_jumpdust)
	}
	
	if (sprite_index == spr_player_suplexdash && !grounded)
		reset_anim(spr_player_suplexgrabjump)
	if (grounded && sprite_index == spr_player_suplexgrabjump && image_index >= 4 && key_dash.down)
	{
		state = states.mach2
		sprite_index = spr_player_mach2
	}
	
	if (scr_hitwall(x + xscale, y) && !grounded)
	{
		{
			wallspeed = movespeed
			if (movespeed < 1)
				wallspeed = 1
			else
				sprite_index = spr_player_wallbounce
			scr_sound_3d(sfx_wallbounce, x, y)
			create_effect(x, y + 2, spr_walljumpeffect)
			state = states.climbwall
			jumpstop = true
			hsp = 0
			movespeed = 0
			vsp = -15
		}
	}
	else if (scr_hitwall(x + xscale, y) && grounded)
	{
		sprite_index = spr_player_suplexbump
		scr_sound_3d(sfx_splat, x, y)
		state = states.jump
		jumpstop = true
		hsp = 5 * -xscale
		vsp = -5
		movespeed = 0
	}
	
	image_speed = 0.35
	switch (sprite_index)
	{
		case spr_player_suplexdash:
			if anim_ended()
				state = states.normal
			break;
		case spr_player_suplexgrabjump:
			if anim_ended()
				image_index = 4
			if (grounded && !key_dash.down && image_index >= 4)
				state = states.normal
			break;
	}
	
	if (anim_ended() && key_dash.down && sprite_index == spr_player_suplexdash)
	{
		state = states.mach2
		sprite_index = spr_player_mach2
	}
	
	if (p_move != 0 && p_move != xscale)
	{
		if !grounded
		{
			reset_anim(spr_player_suplexcancel)
			state = states.jump
		}
		else
			state = states.normal
		movespeed = 0
	}
	aftimg_timers.blur.do_it = false
}