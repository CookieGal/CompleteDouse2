maxspeed = 10
image_speed = 0.35
depth = -5

savedcx = camera_get_view_x(view_camera[0])
savedcy = camera_get_view_y(view_camera[0])

savedx = x
savedy = y

x = 1728
y = 352

alarm[1] = 10

image_alpha = 0
xscale = 1

emitter = emitter_create_quick(x, y, self)
scr_sound_3d_on(emitter, sfx_oiflippomove, true)
scr_sound_3d_on(emitter, sfx_oiflippomove2, true)
