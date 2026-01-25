global.gameframe_caption_text = "no escape"
global.gameframe_caption_icon = asset_get_index("spr_gameframe_icon3")
global.panic.active = false

with (obj_player)
{
	state = states.bump
	sprite_index = spr_player_deathcutscene
	image_speed = 0.35
	hsp = 0
	movespeed = 0
}

if instance_exists(obj_exitgate)
{
	with obj_exitgate
	{
		shake_camera(5)
		scr_sound_3d(sfx_groundpound, x, y)
		instance_create(x, y, obj_oiflippo)
		instance_destroy()
	}
}
