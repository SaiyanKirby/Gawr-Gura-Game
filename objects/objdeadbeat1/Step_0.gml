if(global.guiActive)
	{
	//pause everything
	for(var a = 0; a < 12; a++)
		{
		if(alarm[a] > 0)
			{alarm[a]++;};
		};
	image_index -= sprite_get_speed(sprite_index)/60;
	exit;
	};

if(iframes > 0)
	{iframes--;};

if(alive)
	{
	if(knockback_time > 0)
		{
		moving = false;
		knockback_time--;
		};

	fnDeadbeat1AI();
	
	if(!moving)
		{
		if(abs(x_speed) <= global.air_friction_constant)
			{x_speed = 0;};
		else
			{x_speed -= global.air_friction_constant * sign(x_speed);};
		};
	
	fnApplyGravity();
	fnActorMove();

	airborne = fnActorIsAirborne();
	};
else
	{fnDeadbeat1SwitchState(0);};