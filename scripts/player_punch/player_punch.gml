function player_punch()
{
	var default_idle = spr_player_idle
	var default_move = spr_player_move
	if global.panic.active
	{
		default_idle = spr_player_panic
		
		if global.panic.timer <= 0
		{
			default_idle = spr_player_hurtidle
			default_move = spr_player_hurtmove
		}
	}
	if room == kb_1
	{
		default_idle = spr_player_twiching
		default_move = spr_player_scaredmove
	}
	if room == tower_3
	{
		default_idle = spr_player_twiching
		default_move = spr_player_scaredmove
	}
	if room == tower_4
	{
		default_idle = spr_player_twiching
		default_move = spr_player_scaredmove
	}
	if room == tower_5
	{
		default_idle = spr_player_hurtidle
		default_move = spr_player_hurtmove
	}
	if room == tower_6
	{
		default_idle = spr_player_hurtidle
		default_move = spr_player_hurtmove
	}
	
	if (p_move != 0 && !place_meeting(x + p_move, y, obj_solid))
	{
		movespeed = approach(movespeed, 3, movespeed > 3 ? 3 : 3)
		if (floor(movespeed) == 3)
			movespeed = 3
		xscale = p_move
		if particle_timer > 0
			particle_timer--
		else
		{
			particle_timer = 12
			scr_sound_3d_pitched(sfx_step, x, y)
			create_effect(x, y + 43, spr_cloudeffect)
		}
	}
	else
		movespeed = 0
	
	hsp = movespeed * xscale
	
	var idlegestures = [
		spr_player_idlefrown, 
		spr_player_idledance, 
		spr_player_idlehand, 
		spr_player_idlecareless, 
		spr_player_idlewhat,
		spr_player_idlebite
	]
	
	if p_move != 0
		idletimer = 120
	
	if (breakdance_secret.buffer < 10)
	{
		if p_move != 0
		{
			if (sprite_index != spr_player_landmove)
				sprite_index = default_move
		}
		else
		{
			if (idletimer <= 0 && idletimer != -4)
			{
				reset_anim(idlegestures[irandom(5)])
				idletimer = -4
				scr_sound(choose(sfx_voice, sfx_voice2, sfx_voice3))
			}
			
			if (anim_ended() && idletimer == -4)
			{
				reset_anim(default_idle)
				idletimer = 180
			}
			
			if (sprite_index != spr_player_machslideend && sprite_index != spr_player_land && sprite_index != spr_player_bodyslamland && sprite_index != spr_player_facehurt && idletimer > 0)
				sprite_index = default_idle
		}
	}
	
	image_speed = 0.35
	
	if !grounded
	{
		state = states.taunt
		reset_anim(global.panic.active && global.panic.timer <= 0 ? spr_player_hurtjump : spr_player_fall)
	}
	
	if (coyote_time && input_buffers.jump > 0)
	{
		input_buffers.jump = 0
		vsp = -11
		state = states.taunt
		reset_anim(global.panic.active && global.panic.timer <= 0 ? spr_player_hurtjump : spr_player_jump)
		jumpstop = false
		create_effect(x, y - 5, spr_highjumpcloud2)
		scr_sound_3d(sfx_jump, x, y)
	}
	
	switch (sprite_index)
	{
		case spr_player_move:
		case spr_player_hurtmove:
			image_speed = clamp(movespeed / 15, 0.35, 0.6);
			break;
		case spr_player_machslideend:
		case spr_player_land:
			reset_anim_on_end(spr_player_idle)
			break;
		case spr_player_landmove:
			image_speed = clamp(movespeed / 15, 0.35, 0.6);
			reset_anim_on_end(spr_player_move);
			break;
		case spr_player_facehurt:
			reset_anim_on_end(spr_player_idle)
			break;
	}
	
	
	
}