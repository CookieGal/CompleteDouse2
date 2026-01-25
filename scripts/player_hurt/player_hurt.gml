function player_hurt()
{
	image_speed = 0.35
	if grounded && vsp >= 0
	{
		state = states.normal
		hsp = 0
		movespeed = 0
		if grounded
			vsp = -4
		if scr_solid(x + hsp, y)
			xscale *= -1
	}
}