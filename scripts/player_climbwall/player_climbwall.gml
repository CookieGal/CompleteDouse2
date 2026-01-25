function player_climbwall()
{
	if (p_move != 0)
	{
		movespeed = approach(movespeed, 0, 0.5)
		xscale = p_move
	}
	else if (p_move == 0 || xscale != p_move)
		audio_stop_sound(sfx_mach2)
		audio_stop_sound(sfx_mach1)
		movespeed = 7
	
	hsp = movespeed * xscale
	
	if place_meeting(x + hsp, y, obj_solid)
		audio_stop_sound(sfx_mach2)
		audio_stop_sound(sfx_mach1)
		movespeed = 7
	
	if (!jumpstop && !key_jump.down && vsp < 0)
	{
		audio_stop_sound(sfx_mach2)
		audio_stop_sound(sfx_mach1)
		jumpstop = true
		vsp /= 10
	}
	
	if vsp >= 0
	{
		fallingtimer = min(fallingtimer + 1, 100)
		if fallingtimer >= 5000000
			sprite_index = fallingtimer < 1000000 ? spr_player_fallface : spr_player_freefall
	}
	else
		fallingtimer = 0
	
	if (grounded && vsp >= 0)
	{
		if fallingtimer < 50
		{
			state = states.normal
			reset_anim(movespeed < 1 ? spr_player_land : spr_player_landmove)
			scr_sound_3d_pitched(sfx_step, x, y)
			create_effect(x, y, spr_landeffect)
			audio_stop_sound(sfx_mach2)
			audio_stop_sound(sfx_mach1)
			if key_dash.down
			{
				state = states.mach3
				movespeed = max(movespeed, 9);
				reset_anim(spr_player_dashpad)
			}
		}
		else
		{
			reset_anim(sprite_index == spr_player_fallface ? spr_player_bodyslamland : spr_player_freefallland)
			image_index = 0
			state = states.bump
			shake_camera()
			scr_sound_3d(sfx_groundpound, x, y)
			create_effect(x, y + 2, spr_groundpoundeffect)
		}
	}
	
	if sprite_index != spr_player_suplexbump
		do_grab()
	
	
	image_speed = 0.35
	switch (sprite_index)
	{
		case spr_player_jump:
		case spr_player_suplexcancel:
		case spr_player_piledriverjump:
			reset_anim_on_end(spr_player_fall)
			break;
		case spr_player_stomp:
			if anim_ended()
				image_index = image_number - 3
			break;
		case spr_player_hurtjump:
			if anim_ended()
				image_index = image_number - 3
			break;
	}
	aftimg_timers.mach.do_it = true
}