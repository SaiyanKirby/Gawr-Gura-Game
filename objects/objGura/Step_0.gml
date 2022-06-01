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

if(!moving)//slow down if not moving
	{
	if(abs(x_speed) <= global.air_friction_constant)
		{x_speed = 0;};
	else
		{x_speed -= global.air_friction_constant * sign(x_speed);};
	};

if(iframes > 0)
	{iframes--;};
else
	{fnEnemyContactDamage();};//check if you got hit by an enemy

airborne = fnActorIsAirborne();

if(knockback_time > 0)
	{
	image_index = 5;
	moving = false;
	knockback_time--;
	fnApplyGravity();
	};
else
	{
	switch(state)
		{
		default:
		case gura_states.idle:
			{fnGuraStateIdle();break;};
		case gura_states.running:
			{fnGuraStateRunning();break;};
		case gura_states.airborne:
			{fnGuraStateAirborne();break;};
		case gura_states.attack_neutral:
			{fnGuraStateAttackNeutral();break;};
		case gura_states.attack_down:
			{fnGuraStateAttackDown();break;};
		/*case gura_states.attack_up:
			{fnGuraStateAttackingUp();break;};*/
		};
	};

fnActorMove();

if(instance_exists(trident_object))
	{
	trident_object.x = x;
	trident_object.y = y;
	trident_object.image_xscale = image_xscale;
	trident_object.image_yscale = image_yscale;
	};
