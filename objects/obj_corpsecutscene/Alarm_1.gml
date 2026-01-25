reset_level()

with obj_player
{
	spawn = noone
	state = states.actor
	vsp = 0
	sprite_index = spr_player_empty
	x = 832
	y = 320
	room_goto(robert_final)
	scr_sound(mu_bleed)
	scr_sound(mu_death)
}
