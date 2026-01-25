//args room, sound asset, continous, secret music

levelsongs = 
[
	[entrance_1, mu_entrance, false, mu_secret],
	[tower_1, mu_hub, false, mu_secret],
	[tower_2, mu_hub, false, mu_secret],
	[krusty_1, mu_krusty, false, mu_secret],
	[krusty_2, mu_krustyB, false, mu_secret],
	[kb_1, mu_pillar, false, mu_secret],
	[tower_3, mu_farm, false, mu_secret],
	[leveltransition, imwatchingyou, false, mu_secret],
	[robert_1, mu_robert, false, mu_secret],
	[endcutscene, mu_end, false, mu_secret],
	[secret_1, mu_end, false, mu_secret]
] //rework this into constructors.

pauseIDS = function(pause = true)
{
	var pauseSounds =
	[
		"mu",
		"prevmu",
		"panic_mu",
		"panic_pinch_mu"
	];
	
	for (var i = 0; i < array_length(pauseSounds); i++)
	{
		var variableAttempt = variable_instance_get(id, pauseSounds[i]);
		
		if variableAttempt != noone
		{
			if pause
				audio_pause_sound(variableAttempt);
			else
				audio_resume_sound(variableAttempt);		
		}
	}
}

mu = noone;
prevmu = noone;
panic_mu = noone;
panic_pinch_mu = noone
pillar_mu = noone
secret_mu = noone
secret_mu_to_play = noone
panic_music_initiated = false
pinch_init = false
lap2 = false
lap2_init = false
