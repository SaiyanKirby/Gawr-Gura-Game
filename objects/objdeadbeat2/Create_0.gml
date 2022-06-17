event_inherited();

hitbox_active = false;
hurtbox_active = false;
moving = false;
alive = false;

swing_hitbox = instance_create_depth(x, y, depth, objDeadbeat2SwingHurtbox);

state = -1;
/*
states:
-2: on a timer before it can respawn
-1: dead but able to rise from the grave
 0: alive, idle
 1: attacking
*/

image_index = 0;
image_speed = 0;

dir = 1;

animation_timer = -1;
rise_grave_time = 45;

alert_distance = 80;

fnDeadbeat2AI = function()
	{
	var _player = instance_find(objGura,0);
	if(!instance_exists(_player))
		{return;};
	else
		{
		if(!instance_exists(swing_hitbox))
			{swing_hitbox = instance_create_depth(x, y, depth, objDeadbeat2SwingHurtbox);};
		swing_hitbox.hurtbox_active = false;
		
		var x_distance = abs(x - _player.x);
		switch(state)
			{
			case -2://dead
				{
				break;
				};
			case -1://rise from grave
				{
				var y_distance = abs(y - _player.y);
				if(animation_timer < 0)
					{
					//come out of grave when player gets close
					if(x_distance <= alert_distance && y_distance <= alert_distance/2)
						{animation_timer = 0;};
					};
				else
					{
					animation_timer++;
					if(animation_timer >= rise_grave_time)
						{
						alive = true;
						affected_by_gravity = true;
						hitbox_active = true;
						hurtbox_active = true;
						hp = max_hp;
						fnDeadbeat2SwitchState(0);
						break;
						};
					};
				break;
				};
			case 0://idle
				{
				dir = (x >= _player.x) ? -1 : 1;
				animation_timer++;
				switch(image_index)//idle animation
					{
					case 1:
						{
						if(animation_timer >= 60)
							{
							image_index = 2;
							animation_timer = 0;
							};
						break;
						};
					case 2:
						{
						if(animation_timer >= 10)
							{
							image_index = 3;
							animation_timer = 0;
							};
						break;
						};
					case 3:
						{
						if(animation_timer >= 30)
							{
							image_index = 4;
							animation_timer = 0;
							};
						break;
						};
					case 4:
						{
						if(animation_timer >= 10)
							{
							image_index = 1;
							animation_timer = 0;
							};
						break;
						};
					};
				with(swing_hitbox)//if close enough, attack the player
					{
					if(instance_place(x, y, objGura))
						{other.fnDeadbeat2SwitchState(1);};
					};
				break;
				};
			case 1://attacking
				{
				animation_timer++;
				switch(image_index)//swing animation
					{
					case 0:
						{
						if(animation_timer >= 3)
							{
							image_index++;
							animation_timer = 0;
							};
						break;
						};
					case 1:
						{
						if(animation_timer >= 10)
							{
							audio_play_sound(sndGuraAttack,0,false);
							image_index++;
							animation_timer = 0;
							};
						break;
						};
					case 2:
					case 3:
					case 4:
					case 5:
					case 6:
					case 7:
						{
						swing_hitbox.hurtbox_active = true;
						if(animation_timer >= 3)
							{
							image_index++;
							animation_timer = 0;
							};
						break;
						};
					case 8:
						{
						if(animation_timer >= 22)
							{
							swing_hitbox.hurtbox_active = false;
							fnDeadbeat2SwitchState(0);
							};
						break;
						};
					};
				break;
				};
			};
		};
	
	image_xscale = dir;
	swing_hitbox.dir = dir;
	swing_hitbox.image_xscale = dir;
	};

fnDeadbeat2SwitchState = function(_state)
	{
	state = _state;
	switch(_state)
		{
		case -2://dead
			{
			dir = 1;
			alive = false;
			hurtbox_active = false;
			hitbox_active = false;
			affected_by_gravity = false;
			image_alpha = 0;
			animation_timer = -2;
			break;
			};
		case -1://rising from grave
			{
			dir = 1;
			alive = false;
			hurtbox_active = false;
			hitbox_active = false;
			affected_by_gravity = false;
			sprite_index = sprDeadbeat2;
			image_index = 0;
			image_speed = 0;
			image_alpha = 1;
			animation_timer = -1;
			break;
			};
		case 0://idle
			{
			sprite_index = sprDeadbeat2;
			image_index = 1;
			image_speed = 0;
			image_alpha = 1;
			hurtbox_active = true;
			hitbox_active = true;
			break;
			};
		case 1://attacking
			{
			sprite_index = sprDeadbeat2Swing;
			image_index = 0;
			image_speed = 0;
			image_alpha = 1;
			hurtbox_active = false;
			animation_timer = 0;
			break;
			};
		};
	image_xscale = dir;
	};

fnEnemyDie = function()
	{
	//override the death code
	fnDeadbeat2SwitchState(-2);
	var v_center = bbox_bottom - ((bbox_bottom - bbox_top)/2);
	instance_create_depth(x, v_center, depth-10, objEnemyDeathEffect);
	audio_play_sound(sndEnemyDeath, 0, 0);
	alarm[1] = -1;
	alarm[0] = respawn_time;
	x = spawn_x;
	y = spawn_y;
	return true;
	};