val = 10
var type = choose("mushroom", "cheese", "tomato", "sausage", "pineapple")
sprite_index = spr_bigcollectcheese
depth = 50

if ds_list_find_index(global.ds_saveroom, id) != -1
	instance_destroy()
