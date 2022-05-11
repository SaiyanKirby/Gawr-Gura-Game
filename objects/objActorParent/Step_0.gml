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

fnActorMove();
