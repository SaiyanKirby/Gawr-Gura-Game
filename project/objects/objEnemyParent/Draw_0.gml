if(!alive)
	{
	if(alarm[0] < 30 && alarm[0]  % 4 > 1)//flash when respawning
		{image_alpha = 0.5};
	else
		{image_alpha = 0;};
	};
else if(alarm[1] > 0)//flash when hitbox isnt active
	{
	if(alarm[1] % 4 > 1)
		{image_alpha = 1};
	else
		{image_alpha = 0;};
	}
else
	{image_alpha = 1;};

draw_self();
