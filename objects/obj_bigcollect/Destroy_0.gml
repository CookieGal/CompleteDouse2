if ds_list_find_index(global.ds_saveroom, id) != -1 exit;

scr_sound(sfx_collectbig)
scr_sound(choose(sfx_voice3, sfx_voice4))
ds_list_add(global.ds_saveroom, id)
