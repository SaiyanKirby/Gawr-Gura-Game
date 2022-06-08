/// @description Function Declarations
event_inherited();

#region state functions

function fnGetStateName()
	{
	switch(state)
		{
		default:
		case gura_states.idle: {return "Idle";};
		case gura_states.running: {return "Running";}
		case gura_states.airborne: {return "Airborne";}
		case gura_states.attack_neutral: {return "Attacking (Neutral)";}
		case gura_states.attack_down: {return "Attacking (Down)";}
		case gura_states.attack_up: {return "Attacking (Up)";}
		};
	};

function fnGuraStateChange(_newstate)
	{
	animation_timer = 0;
	image_xscale = dir;
	ds_list_clear(global.input_buffer);
	ds_list_set(global.input_buffer, iPAUSE, false);
	switch(_newstate)
		{
		default:
		case gura_states.idle:
			{
			image_index = 0;
			state = gura_states.idle;
			jumps = max_jumps;
			jump_hold_time = 0;
			airborne_time = -1;
			break;
			};
		case gura_states.running:
			{
			if(image_index == 1)
				{image_index = 0;};
			else
				{image_index = 1;};
			state = gura_states.running;
			jumps = max_jumps;
			jump_hold_time = 0;
			airborne_time = -1;
			break;
			};
		case gura_states.airborne:
			{
			image_index = 1;
			state = gura_states.airborne;
			break;
			};
		case gura_states.attack_neutral:
			{
			jump_hold_time = 0;
			state = gura_states.attack_neutral;
			airborne_time = -1;
			break;
			};
		case gura_states.attack_down:
			{
			state = gura_states.attack_down;
			airborne_time = -1;
			break;
			};
		case gura_states.attack_up:
			{
			state = gura_states.attack_up;
			airborne_time = -1;
			break;
			};
		};
	};

function fnGuraStateIdle()
	{
	image_index = 0;
	moving = false;
	if(global.inputs[# iHELD, iLEFT] ^ global.inputs[# iHELD, iRIGHT])
		{
		moving = true;
		fnGuraStateChange(gura_states.running)
		};
	
	//if airborn, switch to airborne state
	if(airborne)
		{
		airborne_time = 0;
		fnGuraStateChange(gura_states.airborne);
		};
	
	if(global.inputs[# iPRESSED, iJUMP]) //on pressing jump, jump
		{fnGuraActionJump();};
	
	else if(global.inputs[# iPRESSED, iATTACK]) //on pressing m1, attack
		{fnGuraActionAttackNeutral();};
	};

function fnGuraStateRunning()
	{
	//if holding left, move left
	if(global.inputs[# iHELD, iLEFT] && !global.inputs[# iHELD, iRIGHT])
		{
		moving = true;
		dir = -1;
		x_speed = -run_speed;
		};
	//if holding right, move right
	if(global.inputs[# iHELD, iRIGHT] && !global.inputs[# iHELD, iLEFT])
		{
		moving = true;
		dir = 1;
		x_speed = run_speed;
		};
	image_xscale = dir;
	
	//animate run cycle
	animation_timer++;
	if(animation_timer >= 6)
		{
		image_index = !image_index;
		animation_timer = 0;
		};
	
	//if not holding anything, switch to idle
	if(!(global.inputs[# iHELD, iLEFT] ^ global.inputs[# iHELD, iRIGHT]))
		{
		moving = false;
		x_speed = 0;
		x_subpixel = 0;
		fnGuraStateChange(gura_states.idle);
		};
	
	//if airborn, switch to airborne
	if(airborne)
		{
		airborne_time = 0;
		fnGuraStateChange(gura_states.airborne);
		};
	
	if(global.inputs[# iPRESSED, iJUMP])//on pressing jump, jump
		{fnGuraActionJump();};
	
	else if(global.inputs[# iPRESSED, iATTACK])//on pressing m1, attack
		{fnGuraActionAttackNeutral();};
	};

function fnGuraStateAirborne()
	{
	image_index = 1;
	//if holding left, move left
	if(global.inputs[# iHELD, iLEFT] && !global.inputs[# iHELD, iRIGHT])
		{
		moving = true;
		dir = -1;
		x_speed = -run_speed;
		};
	//if holding right, move right
	if(global.inputs[# iHELD, iRIGHT] && !global.inputs[# iHELD, iLEFT])
		{
		moving = true;
		dir = 1;
		x_speed = run_speed;
		};
	image_xscale = dir;
	
	//for "coyote time" - a small jump buffer
	if(airborne_time != -1)
		{
		airborne_time++;
		if(airborne_time == 15)//0.25 second buffer
			{
			jumps--;
			airborne_time = -1;
			};
		};
	
	//if not holding left/right, stop moving
	if(!(global.inputs[# iHELD, iLEFT] ^ global.inputs[# iHELD, iRIGHT]))
		{moving = false;};
	
	//on pressing jump, jump again
	if(global.inputs[# iPRESSED, iJUMP] && jumps > 0)
		{fnGuraActionJump()};
	
	//allow more fine control over jump height
	if(global.inputs[# iHELD, iJUMP] && (y_speed * global.gravity_dir) <= 0 && jump_hold_time > 0)
		{jump_hold_time--;};
	else
		{
		jump_hold_time = 0;
		fnApplyGravity();
		};
	
	//switch to running/idle if on the ground
	if((y_speed * global.gravity_dir) >= 0 && !airborne)
		{
		if(global.inputs[# iHELD, iLEFT] ^ global.inputs[# iHELD, iRIGHT])
			{
			moving = true;
			fnGuraStateChange(gura_states.running);
			};
		else
			{
			moving = false;
			fnGuraStateChange(gura_states.idle);
			};
		};
	
	//switch to attacking when an attack button is pressed
	if(global.inputs[# iPRESSED, iATTACK])
		{fnGuraActionAttackNeutral()}
	//attack down if you're holding down
	if(global.inputs[# iHELD, iDOWN])
		{fnGuraActionAttackDown();};
	};

function fnGuraStateAttackNeutral()
	{
	animation_timer++;
	
	var _ready_time = 10;//time to hold out the trident
	var _end_lag = 10;//how long to keep the trident out
	
	if(attack_combo == 3)
		{
		_ready_time = 15;
		_end_lag = 20;
		}
	
	if(airborne)
		{
		fnApplyGravity();
		
		//only allow movement while in the air
		//if holding left, move left
		if(global.inputs[# iHELD, iLEFT] && !global.inputs[# iHELD, iRIGHT])
			{
			moving = true;
			x_speed = min(x_speed, run_speed * -1);
			};
		//if holding right, move right
		else if(global.inputs[# iHELD, iRIGHT] && !global.inputs[# iHELD, iLEFT])
			{
			moving = true;
			x_speed = max(x_speed, run_speed);
			};
		else
			{moving = false;};
		};
	else
		{moving = false;};
	
	if(global.inputs[# iPRESSED, iATTACK])
		{global.input_buffer[| iATTACK] = true;};
	
	if(animation_timer == _ready_time)//thrust trident
		{
		if(!airborne)
			{
			//push you forward
			x_speed += attack_combo * 0.4 * sign(dir);
			};
		else
			{
			//give you a little boost up when falling
			y_speed = -1 * global.gravity_dir;
			};
		audio_play_sound(sndGuraAttack,0,false);
		trident_object.image_index = 1;
		};
	else if(animation_timer >= _ready_time)
		{
		image_index = 3;
		if(global.input_buffer[| iATTACK] = true && attack_combo < 3)//for 3-hit combo
			{
			if(animation_timer >= _ready_time + 5)
				{
				global.input_buffer[| iATTACK] = false;
				fnGuraActionAttackNeutral();
				};
			};
		};
	else
		{image_index = 2;};
	
	if(animation_timer >= _ready_time + _end_lag + 5 || animation_timer == -1)//put it away
		{
		global.input_buffer[| iATTACK] = false;
		fnGuraActionCleanUpAttacks();
		};
	};

function fnGuraStateAttackDown()
	{
	image_index = 4;
	//if holding left, move left
	if(global.inputs[# iHELD, iLEFT] && !global.inputs[# iHELD, iRIGHT])
		{
		moving = true;
		x_speed = -run_speed;
		};
	//if holding right, move right
	if(global.inputs[# iHELD, iRIGHT] && !global.inputs[# iHELD, iLEFT])
		{
		moving = true;
		x_speed = run_speed;
		};
	image_xscale = dir;
	if(trident_object == noone || !instance_exists(trident_object))
		{
		trident_object = instance_create_depth(x, y, depth-1, objGuraTridentDown);
		trident_object._parent = self;
		};
	trident_object.image_xscale = dir;
	trident_object.dir = dir;
	
	//if not holding left/right, stop moving
	if(!(global.inputs[# iHELD, iLEFT] ^ global.inputs[# iHELD, iRIGHT]))
		{moving = false;};
	
	//on pressing jump, jump again
	if(global.inputs[# iPRESSED, iJUMP] && jumps > 0)
		{
		fnGuraActionCleanUpAttacks(true);
		fnGuraStateChange(gura_states.airborne);
		fnGuraActionJump()
		};
	
	//allow more fine control over jump height
	if(global.inputs[# iHELD, iJUMP] && (y_speed * global.gravity_dir) <= 0 && jump_hold_time > 0)
		{jump_hold_time--;};
	else
		{
		jump_hold_time = 0;
		fnApplyGravity();
		};
	
	//allow canceling out of the down stab with a forward attack
	if(global.inputs[# iPRESSED, iATTACK])
		{
		attack_combo = 0;
		fnGuraActionAttackNeutral();
		exit;
		};
	
	//switch to running/idle if on the ground
	if((y_speed * global.gravity_dir) >= 0 && !airborne)
		{
		fnGuraActionCleanUpAttacks(true);
		if(global.inputs[# iHELD, iLEFT] ^ global.inputs[# iHELD, iRIGHT])
			{
			moving = true;
			fnGuraStateChange(gura_states.running);
			};
		else
			{
			moving = false;
			fnGuraStateChange(gura_states.idle);
			};
		};
	};
#endregion

#region //action functions

function fnGuraActionJump()
	{
	jumps--;
	jump_hold_time = jump_hold_time_max;
	airborne_time = -1;
	y_speed = jump_height * global.gravity_dir;
	var _jumpeffect = instance_create_depth(x, y, depth+1, objGuraJumpParticle);
	if(!airborne)
		{_jumpeffect.sprite_index = sprGuraJumpParticleGround};
	else
		{_jumpeffect.sprite_index = sprGuraJumpParticleAir};
	_jumpeffect.image_index = 0;
	audio_play_sound(sndGuraJump,0,false);
	fnGuraStateChange(gura_states.airborne);
	};

function fnGuraActionAttackNeutral()
	{
	//neutral attack
	attack_combo++;
	animation_timer = 0;
	image_index = 2;
	//if holding left, turn left
	if(global.inputs[# iHELD, iLEFT] && !global.inputs[# iHELD, iRIGHT])
		{dir = -1;};
	//if holding right, turn right
	if(global.inputs[# iHELD, iRIGHT] && !global.inputs[# iHELD, iLEFT])
		{dir = 1;};
	image_xscale = dir;
	fnGuraActionCleanUpAttacks(false);
	if(trident_object == noone || !instance_exists(trident_object))
		{trident_object = instance_create_depth(x, y, depth-1, objGuraTridentThrust);}
	trident_object._parent = self;
	ds_list_clear(trident_object.enemies_hit);
	if(attack_combo == 3)
		{trident_object.damage = 2;};
	trident_object.image_index = 0;
	trident_object.image_xscale = image_xscale;
	trident_object.image_yscale = image_yscale;
	trident_object.dir = dir;
	fnGuraStateChange(gura_states.attack_neutral);
	};

function fnGuraActionAttackDown()
	{
	fnGuraActionCleanUpAttacks(true);
	trident_object = instance_create_depth(x, y, depth-1, objGuraTridentDown);
	trident_object._parent = self;
	trident_object.sprite_index = sprGuraTridentDown;
	trident_object.image_index = 0;
	trident_object.image_xscale = image_xscale;
	trident_object.image_yscale = image_yscale;
	trident_object.dir = dir;
	trident_object.x = x;
	fnGuraStateChange(gura_states.attack_down);
	};

function fnGuraActionCleanUpAttacks(reset_combo = true)
	{
	//clean up after attacking
	animation_timer = 0;
	if(reset_combo)
		{attack_combo = 0;};
	if(!airborne) //if on the ground, switch to idle
		{fnGuraStateChange(gura_states.idle)};
	else //if airborn, switch to airborne
		{fnGuraStateChange(gura_states.airborne)};
	instance_destroy(trident_object);
	trident_object = noone;
	};

#endregion

function fnEnemyContactDamage()
	{
	if(iframes > 0)
		{return false;};
	//create a temporary list of every collision on this frame
	ds_list_clear(enemies_contacting)
	var _num = instance_place_list(x, y, objEnemyParent, enemies_contacting, true);
	var _enemy = noone;
	if(_num > 0 && !ds_list_empty(enemies_contacting))
		{
		var hit = false;
		//search the list so we dont hit something twice
		for(var i = 0; i < ds_list_size(enemies_contacting); i++)
			{
			var _enemy = enemies_contacting[|i];
			if(!hit && _enemy.hitbox_active)
				{
				hit = true;
				var _dir = sign(x-_enemy.x);//get knocked away from the enemy
				hp = clamp(hp-_enemy.damage, 0, max_hp);
				
				var damage_number = instance_create_depth(x, bbox_top, depth-10, objDamageNumber)
				damage_number.damage = _enemy.damage;
				damage_number.x_speed = _dir / 2;
				
				fnGuraActionCleanUpAttacks();
				iframes = 40;
				knockback_time = 20;
				animation_timer = 0;
				alarm[0] = hp_regen_time;//reset hp regen delay
				x_speed = _enemy.knockback_x * sign(_dir);
				y_speed = _enemy.knockback_y * global.gravity_dir;
				if(_dir != 0)
					{
					dir = -_dir;
					image_xscale = dir;
					};
				break;
				};
			};
		if(hit)
			{audio_play_sound(sndHurt, 0, false);};
		};
	};
