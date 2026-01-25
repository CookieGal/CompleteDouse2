function player_parry()
{
	hsp = xscale * movespeed
	
	if movespeed < 0
		movespeed += 0.2
	else
		movespeed = 0
	
	image_speed = 0.35
	
	if anim_ended()
		state = states.normal
}