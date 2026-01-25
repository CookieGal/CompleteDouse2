if global.panic.active
{
	global.gameframe_caption_text = "LEAVE"
	global.gameframe_caption_icon = asset_get_index("spr_gameframe_icon3")
	
	var lay = layer_get_id("Backgrounds_scroll3")
	layer_background_sprite(layer_background_get_id(lay), bg)
}
