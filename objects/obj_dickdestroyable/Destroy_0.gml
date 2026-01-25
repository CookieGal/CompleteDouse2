if (ds_list_find_index(global.ds_saveroom, id) == -1)
{
	repeat 2
    {
        with create_debris(x + random_range(0, 64), y + random_range(0, 64), spr_dickdestroyable_debris)
        {
            hsp = random_range(-5, 5)
            vsp = random_range(-10, 10)
			image_speed = 0
			image_index = random_range(0, image_number - 1)
        }
    }
	create_effect(x + random_range(0, sprite_width), y + random_range(0, sprite_height), spr_destroyable_smoke)
	
	sleep(5)
    scr_sound_3d(choose(sfx_breakblock1, sfx_breakblock2), x, y)
	scr_sound_3d(choose(sfx_block1, sfx_block2), x, y)
	ds_list_add(global.ds_saveroom, id)
}
