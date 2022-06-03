exit;

function fnClearInputs()
	{
	ds_grid_set_region(global.inputs, iPRESSED, 0, iRELEASED, iGRIDHEIGHT-1, false);
	io_clear();
	};

function fnSortGUIStack()
	{
	for(var i = 0; i < ds_list_size(global.guiStack); i++)
		{
		var _window = global.guiStack[|i];
		if(instance_exists(_window))
			{_window.depth = -1010 - (i * 10);};
		else
			{ds_list_delete(global.guiStack, i);};
		};
	};

function fnInitializeInputs()
	{
	//set all inputs to keyboard
	ds_grid_set_region(global.inputs, iDEVICE, 0, iDEVICE, iGRIDHEIGHT-1, iKEYBOARD);
	//set all pressed/held/released to false
	fnClearInputs();
	//set each button
	global.inputs[# iBUTTONID, iLEFT] = ord("A");
	global.inputs[# iBUTTONID, iRIGHT] = ord("D");
	global.inputs[# iBUTTONID, iUP] = ord("W");
	global.inputs[# iBUTTONID, iDOWN] = ord("S");
	global.inputs[# iBUTTONID, iJUMP] = vk_space;

	global.inputs[# iDEVICE, iATTACK] = iMOUSE;
	global.inputs[# iBUTTONID, iATTACK] = mb_left;

	global.inputs[# iBUTTONID, iCONFIRM] = vk_space;
	global.inputs[# iBUTTONID, iBACK] = vk_escape;
	global.inputs[# iBUTTONID, iMENU] = vk_escape;
	};