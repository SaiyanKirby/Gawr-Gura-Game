if(iframes > 0)
	{iframes--;};

if(knockback_time > 0)
	{
	moving = false;
	knockback_time--;
	};

if(!moving)
	{
	if(abs(x_speed) <= global.air_friction_constant)
		{x_speed = 0;};
	else
		{x_speed -= global.air_friction_constant * sign(x_speed);};
	};

fnApplyGravity();
fnActorMove();
