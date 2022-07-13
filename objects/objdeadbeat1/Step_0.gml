if(global.guiActive || global.hitstop > 0)
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

if(state == -1)
	{fnEnemyAI();};
else if(state >= 0)
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
		{
		moving = false;
		knockback_time--;
		};

	fnEnemyAI();
	
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