if(global.guiActive)
	{
	image_index -= sprite_get_speed(sprite_index)/60;
	exit;
	};

if(image_index >= 4)
	{instance_destroy();};
