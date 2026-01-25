function anim_ended()
{
	return image_index >= image_number - 1;
}

function do_grab()
{
	if input_buffers.grab > 0
	{
		input_buffers.grab = 0
		if (!key_up.down)
		{
			movespeed = max(movespeed, 5)
			if state == states.normal
				movespeed = 7
			state = states.grab
			reset_anim(spr_player_suplexdash)
			scr_sound_3d_on(myemitter, sfx_suplexdash)
			particle_create(x, y, particles.genericpoof, xscale, 1, spr_jumpdust)
		}
	}
}

function player_sounds()
{	
	struct_foreach(loop_sounds, function(_name, _data)
	{
		var _id = obj_player
		
		var dont_play = false
		
		if _id.state != _data.state
			dont_play = true
			
		if warping
			dont_play = true
		
		if variable_struct_exists(_data, "func")
		{
			if _data.func()
				dont_play = true
		}
		
		var confirmed_3d = false
		
		if (variable_struct_exists(_data, "is_3d"))
			confirmed_3d = _data.is_3d
		
		if confirmed_3d
		{
			if (_data.sndid == noone && !dont_play && _id.myemitter != noone)
			{
				_data.sndid = scr_sound_3d_on(_id.myemitter, _data.sound, true)
				
				if struct_exists(_data, "looppoints")
				{
					audio_sound_loop_start(_data.sndid, _data.looppoints[0])
					audio_sound_loop_end(_data.sndid, _data.looppoints[1])
				}
			}
			else if (_data.sndid != noone && dont_play)
			{
				audio_stop_sound(_data.sndid)
				_data.sndid = noone
			}
		}
		else
		{
			if (_id.state == _data.state && !dont_play && _data.sndid == noone)
			{
				_data.sndid = scr_sound(_data.sound, true)
				if struct_exists(_data, "looppoints")
				{
					audio_sound_loop_start(_data.sndid, _data.looppoints[0])
					audio_sound_loop_end(_data.sndid, _data.looppoints[1])
				}
			}
			else if (_data.sndid != noone && dont_play)
			{
				audio_stop_sound(_data.sndid)
				_data.sndid = noone
			}
		}
	})
	
	if (state != states.grab)
		audio_stop_sound(sfx_suplexdash)
		
}

function decrease_score(val)
{
	var s = global.score - val
	var num = -val
	
	if s < 0
		num += abs(0 - s)
	
	if num < 0
	{
		with instance_create(0, 0, obj_negativenumber)
			number = string(num)
	}
	
	global.score = max(global.score - val, 0)
}

function do_hurt(obj = noone)
{
	if state == states.defeat || state == states.actor
		return;
	
	if obj != noone
	{
		var xh = lerp(obj.bbox_left, obj.bbox_right, 0.5)
		var goto_xscale = 1
		if x != xh
			goto_xscale = sign(x - xh)
		var facing = xscale == -goto_xscale
		hsp = 8 * goto_xscale
		sprite_index = facing ? spr_player_hurt : spr_player_hurtbehind
		
		if obj.object_index == obj_outlet
			scr_sound_3d(sfx_electricity, x, y)
	}
	else
		sprite_index = spr_player_hurt
	
	state = states.hurt
	vsp = -12
	sleep(100)
	scr_sound_pitched(sfx_hurt, 0.9, 1.1)
	scr_sound_pitched(choose(sfx_voicehurt, sfx_voicehurt2, sfx_voicehurt3))
		
	if !global.boss_room
	{
		global.combo.timer -= 30
		decrease_score(50)
		
		with obj_tv
			tv_expression(spr_tv_hurt)
	}
	else
	{
		if instance_exists(obj_bossstate)
			obj_bossstate.player.hp--
	}
}

function scr_hitwall(_x, _y)
{
	return place_meeting(_x, _y, obj_solid) || behind_slope(_x, _y)
}
