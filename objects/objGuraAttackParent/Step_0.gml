if(!instance_exists(_parent))
	{
	instance_destroy();
	exit;
	};

if(hitbox_active)
	{
	//create a temporary list of every collision on this frame
	ds_list_clear(enemies_hit_this_frame)
	var num = instance_place_list(x, y, objEnemyParent, enemies_hit_this_frame, true);
	var _enemy = noone;
	if(num > 0)
		{
		var play_hit_sound = false;
		//search the list so we dont hit something twice
		for(var i = 0; i < ds_list_size(enemies_hit_this_frame); i++)
			{
			_enemy = enemies_hit_this_frame[|i];
			var _index = ds_list_find_index(enemies_hit, _enemy)
			if(_index == -1 && instance_exists(_enemy))
				{
				if(_enemy.alive)
					{
					var _hit = _enemy.fnHurtEnemy(damage, knockback_x * dir, knockback_y, knockback_time, enemy_hurtbox_disable_time);
					if(_hit)
						{
						ds_list_add(enemies_hit, _enemy);
						play_hit_sound = true;
						};
					};
				};
			};
		if(play_hit_sound)
			{audio_play_sound(sndHurt, 0, 0);};
		};
	};
