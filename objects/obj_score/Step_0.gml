global.score = max(0, global.score)
shake_mag = max(shake_mag - 100, 0)

visible = true

if (string_starts_with(room_get_name(room), "tower") || room == rank_room || room == rm_timesup || room == mainmenu || room == kb_1 || room == leveltransition || room == rm_oiflipposight || room == rm_timesup2 || room == endcutscene || room == corpsecutscene || room == robert_final || room == secret_1)
	visible = false

if global.boss_room
	visible = false

x = 832 + irandom_range(shake_mag, -shake_mag)
y = 80 + irandom_range(shake_mag, -shake_mag)
