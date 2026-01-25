if !info_visible
	exit;

draw_set_font(-4)
draw_set_align(fa_middle, fa_bottom)

draw_set_alpha(0)
draw_set_color(c_black)
draw_rectangle(0, screen_h - 40, 300, screen_h, false)

draw_reset_color()

var ver_str = $"{version}" 

draw_set_halign(fa_center)
draw_set_alpha(0.5)
draw_set_color(c_black)
draw_rectangle(screen_w - string_width(ver_str), screen_h - string_height(ver_str), screen_w, screen_h, false)

draw_reset_color()

draw_text(screen_w, screen_h, ver_str)
