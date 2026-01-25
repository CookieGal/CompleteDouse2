if ds_list_find_index(global.ds_saveroom, id) != -1 exit;

global.score += 15

particle_create(x, y, particles.bang)
ds_list_add(global.ds_saveroom, id)
scr_sound_3d_pitched(sfx_gore, x, y)

with create_debris(x, y - 32, spr_smiley_chunks)
	image_index = 0
with create_debris(x, y + 32, spr_smiley_chunks)
	image_index = 1
with create_debris(x - 10, y, spr_smiley_chunks)
	image_index = 2
with create_debris(x, y, spr_smiley_chunks)
	image_index = 3

instance_destroy()
