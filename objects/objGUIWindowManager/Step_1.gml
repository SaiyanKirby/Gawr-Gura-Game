if(keyboard_check_pressed(vk_escape))
	{
	var _paused = instance_find(objGUIPauseWindow,0);
	if(_paused == noone)
		{instance_create_depth(0, 0, -1000, objGUIPauseWindow);};
	else
		{instance_destroy(_paused);};
	};

global.guiActive = !ds_list_empty(global.guiStack);
