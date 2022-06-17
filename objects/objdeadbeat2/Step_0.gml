if(global.guiActive)
	{
	//pause everything
	for(var a = 0; a < 12; a++)
		{
		if(alarm[a] > 0)
			{alarm[a]++;};
		};
	exit;
	};

fnDeadbeat2AI()

if(state > -1)
	{
	if(iframes > 0)
		{iframes--;}
		
	if(alarm[1] > 0)//flash when hitbox isnt active
		{
		if(alarm[1] % 4 > 1)
			{image_alpha = 1};
		else
			{image_alpha = 0;};
		}
	else
		{image_alpha = 1;};
		
	if(knockback_time > 0)
		{knockback_time--;};
	
	if(abs(x_speed) <= global.air_friction_constant)
		{x_speed = 0;};
	else
		{x_speed -= global.air_friction_constant * sign(x_speed);};
	
	fnApplyGravity();
	fnActorMove();

	airborne = fnActorIsAirborne();
	};

swing_hitbox.x = x;
swing_hitbox.y = y;