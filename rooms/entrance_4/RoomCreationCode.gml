if global.panic.active
{
	global.gameframe_caption_text = "I think it is time to go, buddy!"
	
	var lay = layer_get_id("Backgrounds_sky1")
	layer_background_sprite(layer_background_get_id(lay), bg_cityoutsidepanic)
	var lay = layer_get_id("Backgrounds_H1")
	layer_background_sprite(layer_background_get_id(lay), bg_buildingspanic)
	var lay = layer_get_id("Backgrounds_H2")
	layer_background_sprite(layer_background_get_id(lay), bg_outsidepanic)
}
