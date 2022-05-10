if(!instance_exists(_parent))
	{
	instance_destroy();
	exit;
	};

if(hitbox_active)
	{
	var _enemy = noone;
	for(var i = 0; i < ds_list_size(enemies_hit); i++)
		{
		_enemy = enemies_hit[|i];
		if(!instance_exists(_enemy) || !instance_place(x, y, _enemy))
			{ds_list_delete(enemies_hit, i)};
		};
	//create a temporary list of every collision on this frame
	ds_list_clear(enemies_hit_this_frame)
	var _num = instance_place_list(x, y, objEnemyParent, enemies_hit_this_frame, true);
	if(_num > 0)
		{
		var play_hit_sound = false;
		//search the list so we dont hit something twice
		for(var i = 0; i < ds_list_size(enemies_hit_this_frame); i++)
			{
			_enemy = enemies_hit_this_frame[|i];
			var _index = ds_list_find_index(enemies_hit, _enemy)
			if(_index == -1 && instance_exists(_enemy))
				{
				var _dir = sign(x - _enemy.x) * -1;
				var _hit = _enemy.fnHurtEnemy(damage, knockback_x * _dir, knockback_y, knockback_time, enemy_hurtbox_disable_time);
				if(_hit)
					{
					ds_list_add(enemies_hit, _enemy);
					play_hit_sound = true;
					};
				};
			};
		if(play_hit_sound)
			{
			audio_play_sound(sndHurt, 0, 0);
			//bounce off the enemy;
			with(_parent)
				{
				//bouncing while holding the button gives you a cancelable full-height jump
				//otherwise, just slightly higher than normal jump with no fine control
				if(global.input_jump_held)
					{
					y_speed = jump_height;
					jump_hold_time = jump_hold_time_max;
					}
				else
					{y_speed = jump_height * 1.25;};
				jumps = max_jumps-1;
				jump_hold_time = jump_hold_time_max;
				};
			};
		};
	};
