reset_level()

with obj_player
{
	spawn = noone
	show_message("i am watching you")
	state = states.actor
	reset_anim(spr_player_walkfront)
	vsp = 0
	x = 672
	y = 754
	room_goto(krusty_1)
}

instance_create(0, 0, obj_fadevisual)
