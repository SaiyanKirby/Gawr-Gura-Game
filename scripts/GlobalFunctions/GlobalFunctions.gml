exit;

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

function fnClearInputs()
	{
	io_clear();
	//set input buffer to all 0s
	ds_list_clear(global.input_buffer);
	ds_list_set(global.input_buffer, iPAUSE, false);
	//reset all keys to false
	ds_grid_set_region(global.inputs, iPRESSED, 0, iRELEASED, iGRIDHEIGHT-1, false);
	};

function fnInitializeInputs()
	{
	//set input buffer to all 0s
	ds_list_set(global.input_buffer, iPAUSE, false);
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
	global.inputs[# iBUTTONID, iPAUSE] = vk_escape;
	};

function fnInputGetStickValues()
	{
	ds_list_copy(global.analogue_sticks_previous, global.analogue_sticks);
	for(var i = 0; i < gamepad_get_device_count(); i++)
		{
		if(gamepad_is_connected(i))
			{
			var _LH = gamepad_axis_value(i, gp_axislh);
			var _LV = gamepad_axis_value(i, gp_axislv);
			var _RH = gamepad_axis_value(i, gp_axisrh);
			var _RV = gamepad_axis_value(i, gp_axisrv);
			//create an array of the left and right stick values
			global.analogue_sticks[| i] = [_LH, _LV, _RH, _RV];
			};
		else
			{global.analogue_sticks[| i] = [0,0,0,0];};
		};
	};

function fnAnalogueCheck(_device, _stick_direction)
	{
	if(!gamepad_is_connected(_device))
		{return false;};
	switch(_stick_direction)
		{
		case gp_stickLleft:
			{return global.analogue_sticks[| _device][0] <= global.analogue_deadzone * -1;};
		case gp_stickLright:
			{return global.analogue_sticks[| _device][0] >= global.analogue_deadzone;};
		case gp_stickLup:
			{return global.analogue_sticks[| _device][1] <= global.analogue_deadzone * -1;};
		case gp_stickLdown:
			{return global.analogue_sticks[| _device][1] >= global.analogue_deadzone;};
		case gp_stickRleft:
			{return global.analogue_sticks[| _device][2] <= global.analogue_deadzone * -1;};
		case gp_stickRright:
			{return global.analogue_sticks[| _device][2] >= global.analogue_deadzone;};
		case gp_stickRup:
			{return global.analogue_sticks[| _device][3] <= global.analogue_deadzone * -1;};
		case gp_stickRdown:
			{return global.analogue_sticks[| _device][3] >= global.analogue_deadzone;};
		};
	return false;
	};

function fnAnalogueCheckPressed(_device, _stick_direction)
	{
	if(!gamepad_is_connected(_device))
		{return false;};
	switch(_stick_direction)
		{
		case gp_stickLleft:
			{return (global.analogue_sticks[| _device][0] <= global.analogue_deadzone * -1) && (global.analogue_sticks_previous[| _device][0] > global.analogue_deadzone * -1);};
		case gp_stickLright:
			{return (global.analogue_sticks[| _device][0] >= global.analogue_deadzone) && (global.analogue_sticks_previous[| _device][0] < global.analogue_deadzone);};
		case gp_stickLup:
			{return (global.analogue_sticks[| _device][1] <= global.analogue_deadzone * -1) && (global.analogue_sticks_previous[| _device][1] > global.analogue_deadzone * -1);};
		case gp_stickLdown:
			{return (global.analogue_sticks[| _device][1] >= global.analogue_deadzone) && (global.analogue_sticks_previous[| _device][1] < global.analogue_deadzone);};
		case gp_stickRleft:
			{return (global.analogue_sticks[| _device][2] <= global.analogue_deadzone * -1) && (global.analogue_sticks_previous[| _device][2] > global.analogue_deadzone * -1);};
		case gp_stickRright:
			{return (global.analogue_sticks[| _device][2] >= global.analogue_deadzone) && (global.analogue_sticks_previous[| _device][2] < global.analogue_deadzone);};
		case gp_stickRup:
			{return (global.analogue_sticks[| _device][3] <= global.analogue_deadzone * -1) && (global.analogue_sticks_previous[| _device][3] > global.analogue_deadzone * -1);};
		case gp_stickRdown:
			{return (global.analogue_sticks[| _device][3] >= global.analogue_deadzone) && (global.analogue_sticks_previous[| _device][3] < global.analogue_deadzone);};
		};
	return false;
	};

function fnAnalogueCheckReleased(_device, _stick_direction)
	{
	if(!gamepad_is_connected(_device))
		{return false;};
	switch(_stick_direction)
		{
		case gp_stickLleft:
			{return (global.analogue_sticks[| _device][0] >= global.analogue_deadzone * -1) && (global.analogue_sticks_previous[| _device][0] < global.analogue_deadzone * -1);};
		case gp_stickLright:
			{return (global.analogue_sticks[| _device][0] <= global.analogue_deadzone) && (global.analogue_sticks_previous[| _device][0] > global.analogue_deadzone);};
		case gp_stickLup:
			{return (global.analogue_sticks[| _device][1] >= global.analogue_deadzone * -1) && (global.analogue_sticks_previous[| _device][1] < global.analogue_deadzone * -1);};
		case gp_stickLdown:
			{return (global.analogue_sticks[| _device][1] <= global.analogue_deadzone) && (global.analogue_sticks_previous[| _device][1] > global.analogue_deadzone);};
		case gp_stickRleft:
			{return (global.analogue_sticks[| _device][2] >= global.analogue_deadzone * -1) && (global.analogue_sticks_previous[| _device][2] < global.analogue_deadzone * -1);};
		case gp_stickRright:
			{return (global.analogue_sticks[| _device][2] <= global.analogue_deadzone) && (global.analogue_sticks_previous[| _device][2] > global.analogue_deadzone);};
		case gp_stickRup:
			{return (global.analogue_sticks[| _device][3] >= global.analogue_deadzone * -1) && (global.analogue_sticks_previous[| _device][3] < global.analogue_deadzone * -1);};
		case gp_stickRdown:
			{return (global.analogue_sticks[| _device][3] <= global.analogue_deadzone) && (global.analogue_sticks_previous[| _device][3] > global.analogue_deadzone);};
		};
	return false;
	};