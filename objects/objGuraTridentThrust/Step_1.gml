if(global.guiActive || global.hitstop > 0)
	{
	//pause everything
	exit;
	};

switch(sprite_index)
	{
	default:
	case sprGuraTridentThrust:
		{
		if(image_index > 0)
			{hurtbox_active = true;};
		else
			{hurtbox_active = false;};
		break;
		};
	case sprGuraTridentDown:
		{hurtbox_active = true;};
	};
