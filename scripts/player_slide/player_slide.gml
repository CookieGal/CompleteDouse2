function player_slide() 
{
	hsp = movespeed * xscale
	
	movespeed = max(movespeed - 0.4, 0);
	
	image_speed = 0.35
	switch sprite_index
	{
		case spr_player_machslideboost:
		case spr_player_machslideboost3:
			var ismach2 = sprite_index == spr_player_machslideboost

			if anim_ended()
			{
				if grounded
				{
					sprite_index = ismach2 ? spr_player_mach2 : spr_player_mach3
					state = ismach2 ? states.mach2 : states.mach3
					movespeed = ismach2 ? 8 : 9
					xscale *= -1
				}
				else
					sprite_index = ismach2 ? spr_player_machslideboostfall : spr_player_machslideboost3fall
			}
			break
		case spr_player_machslideboostfall:
		case spr_player_machslideboost3fall:
			var ismach2 = sprite_index == spr_player_machslideboostfall
			
			if (grounded)
			{
				sprite_index = ismach2 ? spr_player_machslideboost : spr_player_machslideboost3;
				image_index = image_number - 1;
			}
			break
		case spr_player_machslidestart:
			if anim_ended()
				image_speed = 0;
			if scr_hitwall(x + xscale, y)
			{
				sprite_index = spr_player_bump
				state = states.bump
				hsp = 5 * -xscale
				vsp = -5
				grounded = false;
				scr_sound_3d(sfx_bumpwall, x, y)
			}
			if !movespeed
			{
				reset_anim(spr_player_machslideend)
				state = states.normal
			}
			break
	}
	instakill = sprite_index == spr_player_machslideboost3;
}