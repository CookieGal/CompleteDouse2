if ds_list_find_index(global.ds_saveroom, id) != -1 exit;

scr_sound(choose(sfx_collect, sfx_collect2, sfx_collect3))
ds_list_add(global.ds_saveroom, id)
