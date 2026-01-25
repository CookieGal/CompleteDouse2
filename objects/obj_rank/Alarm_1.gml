room_goto(tower_1)
reset_level()
with obj_player
{
	spawn = noone
	x = -376
	y = 288
	room_goto(leveltransition)
	state = states.actor
	reset_anim(spr_player_walkfront)
}

instance_destroy()
