if(global.inputs[# iPRESSED, iBACK] || global.inputs[# iPRESSED, iPAUSE])
	{
	if(ds_list_empty(global.guiStack) && instance_find(objGUIPauseWindow,0) == noone)
		{
		fnClearInputs();
		instance_create_depth(0, 0, -1000, objGUIPauseWindow);
		};
	};

global.guiActive = !ds_list_empty(global.guiStack);