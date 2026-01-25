tvs =  [new ini_menu_tv_inst(384, 96, 
			spr_menutv1_off,
			spr_menutv1_whitenoise,
			spr_menutv1_selected,
			spr_menutv1_confirm, "1")]

for (var i = 0; i < array_length(tvs); i++) 
{
	with tvs[i]
	{
		pattern_init()
		var ini_str = $"saves/saveData{filename}.ini"
		if file_exists(ini_str)
		{
			save_exists = true
			ini_open(ini_str)
			pal_ix = ini_read_real("Clothes", "palette_index", 1)
			pat_spr = ini_read_real("Clothes", "pattern_sprite", pat_pizza)
			ini_close()
		}
	}
}

static_snd = scr_sound(sfx_menustatic, true)
audio_sound_gain(static_snd, 0, 0)

mu = scr_sound(mu_mainmenu, true)
audio_sound_loop_end(mu, 4.76)

cur_selected = 1
state = 0
menu_dark = true
dark_state = 0
	
function ini_menu_tv_inst(_x, _y, _sproff, _sprnoise, _sprselect, _sprconfirm, _filename) constructor
{
	x = _x
    y = _y
    filename = _filename
	sprs = {
		off: _sproff,
		whitenoise: _sprnoise,
		selected: _sprselect,
		confirm: _sprconfirm
	}
	state = 0
	sprite_index = _sproff
	image_index = 0
	buffer = 30
	pal_ix = 1
	pat_spr = noone
	save_exists = false
}

depth = -100
