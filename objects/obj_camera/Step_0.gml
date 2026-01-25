mag -= mag_decel

var target = obj_player

if instance_exists(obj_player)
{
	var target_spd = 0
	var appr_spd = 5
	
	cam_charge = approach(cam_charge, target_spd, appr_spd)
}
