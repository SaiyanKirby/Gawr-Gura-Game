event_inherited();

image_speed = 0;

dir = 1;
movement_speed = 0.25;

state = 0;
alert_timer = 0;
alert_distance = 80;

function fnDeadbeat1AI()
	{
	image_xscale = dir;
	var _player = instance_find(objGura,0);
	if(!instance_exists(_player))
		{fnDeadbeat1SwitchState(0);};
	else
		{
		var _distance = point_distance(x, y, _player.x, _player.y);
		switch(state)
			{
			case 0://idle
				{
				moving = false;
				if(_distance <= alert_distance && _distance > 4)
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
				if(x < global.HUD_x-16 || x > global.HUD_x+(global.HUD_width/global.scale)+16)
					{
					fnDeadbeat1SwitchState(0);
					break;
					};
				else
					{
					if(_distance > alert_distance * 2 || _distance <= 4)
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
					};
				break;
				};
			case 2://moving
				{
				moving = true;
				dir = (x >= _player.x) ? -1 : 1;
				if(x < global.HUD_x-16 || x > global.HUD_x+(global.HUD_width/global.scale)+16)
					{
					fnDeadbeat1SwitchState(0);
					break;
					};
				else
					{
					if(_distance > alert_distance * 1.5 || _distance <= 4)
						{
						fnDeadbeat1SwitchState(0);
						break;
						};
					else
						{
						if(knockback_time <= 0)
							{
							x_speed = movement_speed * dir;
							if(y_speed == 0 && !airborne)
								{
								if(fnActorCollide(x + dir, y))
									{
									//jump if up against a wall
									y_speed -= 2.5;
									audio_play_sound(sndGuraJump,0,false);
									var _jumpeffect = instance_create_depth(x, y, depth+1, objGuraJumpParticle);
									_jumpeffect.sprite_index = sprGuraJumpParticleGround;
									_jumpeffect.image_index = 0;
									airborne = true;
									};
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
		case 0://idle
			{
			sprite_index = sprDeadbeat1;
			image_index = 0;
			image_speed = 0;
			break;
			};
		case 1://alert
			{
			sprite_index = sprDeadbeat1;
			image_index = 1;
			image_speed = 0;
			alert_timer = 0;
			break;
			};
		case 2://moving
			{
			sprite_index = sprDeadbeat1Walk;
			image_index = 0;
			image_speed = 1;
			break;
			};
		};
	image_xscale = dir;
	};