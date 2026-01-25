global.gameframe_caption_text = "Someday there will be freedom."

if global.panic.active
{
	global.gameframe_caption_text = "LEAVE"
	global.gameframe_caption_icon = asset_get_index("spr_gameframe_icon3")
}
