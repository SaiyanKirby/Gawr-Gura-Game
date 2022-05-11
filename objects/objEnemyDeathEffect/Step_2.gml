if(global.guiActive)
	{
	//pause everything
	image_index -= sprite_get_speed(sprite_index)/60;
	exit;
	};

if(image_index == 6)
	{instance_destroy();};
