if(global.guiActive)
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
			{hitbox_active = true;};
		else
			{hitbox_active = false;};
		break;
		};
	case sprGuraTridentDown:
		{hitbox_active = true;};
	};
