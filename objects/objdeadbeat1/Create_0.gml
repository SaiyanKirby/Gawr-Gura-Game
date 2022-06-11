event_inherited();

alive = false;
state = -1;
/*
states:
-2: on a timer before it can respawn
-1: dead but able to rise from the grave
 0: alive, idle
 1: alert
 2: moving
*/

image_index = 1;
image_speed = 0;

dir = 1;
movement_speed = 0.25;
last_jump_x = -1;//so he doesn't just jump forever

alert_timer = -1;
alert_distance = 80;
rise_grave_time = 45;

function fnDeadbeat1AI()
	{
	image_xscale = dir;
	var _player = instance_find(objGura,0);
	if(!instance_exists(_player))
		{return;};
	else
		{
		var x_distance = abs(x - _player.x);
		var y_distance = abs(y - _player.y);
		switch(state)
			{
			case -2://dead
				{
				break;
				};
			case -1://rise from grave
				{
				if(alert_timer < 0)
					{
					//come out of grave when player gets close
					if(x_distance <= alert_distance && y_distance <= alert_distance/2)
						{alert_timer = 0;};
					};
				else
					{
					alert_timer++;
					if(alert_timer >= rise_grave_time)
						{
						alive = true;
						affected_by_gravity = true;
						hitbox_active = true;
						hurtbox_active = true;
						hp = max_hp;
						fnDeadbeat1SwitchState(1);
						break;
						};
					};
				break;
				};
			case 0://idle
				{
				moving = false;
				if(x_distance <= alert_distance && x_distance > 4)
					{
					dir = (x >= _player.x) ? -1 : 1;
					fnDeadbeat1SwitchState(1);
					};
				break;
				};
			case 1://alert
				{
				moving = false;
				dir = (x >= _player.x) ? -1 : 1;
				if(x_distance > alert_distance * 2 || x_distance <= 4 || fnActorIsOffScreen())
					{
					fnDeadbeat1SwitchState(0);
					break;
					};
				else
					{
					alert_timer++;
					if(alert_timer >= 30)
						{fnDeadbeat1SwitchState(2);};
					};
				break;
				};
			case 2://moving
				{
				moving = true;
				dir = (x >= _player.x) ? -1 : 1;
				if(x_distance > alert_distance * 1.5 || x_distance <= 4 || fnActorIsOffScreen())
					{
					fnDeadbeat1SwitchState(0);
					break;
					};
				else
					{
					if(knockback_time <= 0)
						{
						x_speed = movement_speed * dir;
						if(last_jump_x != x && y_speed == 0 && !airborne)
							{
							if(fnActorCollide(x + dir, y))
								{
								//jump if up against a wall
								y_speed -= 2.5;
								last_jump_x = x;
								audio_play_sound(sndGuraJump,0,false);
								var _jumpeffect = instance_create_depth(x, y, depth+1, objGuraJumpParticle);
								_jumpeffect.sprite_index = sprGuraJumpParticleGround;
								_jumpeffect.image_index = 0;
								};
							};
						};
					};
				break;
				};
			};
		};
	};

function fnDeadbeat1SwitchState(_state)
	{
	state = _state;
	switch(_state)
		{
		case -2://dead
			{
			dir = 1;
			moving = false;
			alive = false;
			hurtbox_active = false;
			hitbox_active = false;
			affected_by_gravity = false;
			image_alpha = 0;
			alert_timer = -2;
			break;
			};
		case -1://rising from grave
			{
			dir = 1;
			moving = false;
			alive = false;
			hurtbox_active = false;
			hitbox_active = false;
			affected_by_gravity = false;
			sprite_index = sprDeadbeat1;
			image_index = 1;
			image_speed = 0;
			image_alpha = 1;
			alert_timer = -1;
			break;
			};
		case 0://idle
			{
			moving = false;
			sprite_index = sprDeadbeat1;
			image_index = 0;
			image_speed = 0;
			image_alpha = 1;
			break;
			};
		case 1://alert
			{
			moving = false;
			sprite_index = sprDeadbeat1;
			image_index = 1;
			image_speed = 0;
			image_alpha = 1;
			alert_timer = 0;
			break;
			};
		case 2://moving
			{
			moving = true;
			sprite_index = sprDeadbeat1Walk;
			image_index = 0;
			image_speed = 1;
			image_alpha = 1;
			last_jump_x = -1;
			break;
			};
		};
	image_xscale = dir;
	};

function fnEnemyDie()
	{
	//override the death code
	fnDeadbeat1SwitchState(-2);
	var v_center = bbox_bottom - ((bbox_bottom - bbox_top)/2);
	instance_create_depth(x, v_center, depth-10, objEnemyDeathEffect);
	audio_play_sound(sndEnemyDeath, 0, 0);
	alarm[1] = -1;
	alarm[0] = respawn_time;
	x = spawn_x;
	y = spawn_y;
	return true;
	};