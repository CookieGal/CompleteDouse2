global.score += 1

if do_particles
{
	with instance_create(x, y, obj_enemycorpse)
		sprite_index = other.sprs.dead

	obj_player.supertauntcount++
	
	particle_create(x, y, particles.bang)
	repeat (3)
		particle_create(x, y, particles.yellowstar)
	particle_create(x, y, particles.genericpoof, xscale, 1, spr_explosioneffect)
	scr_sound(sfx_explosion)
	scr_sound(choose(sfx_punch1, sfx_punch2, sfx_punch3, sfx_punch4, sfx_punch5))
	
	ds_list_add(!escape ? global.ds_dead_enemies : global.ds_escapesaveroom, id)
}