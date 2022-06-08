//set each part of the input grid each frame

fnInputGetStickValues();//set up the array of gamepad raw analogue stick values

for(var b = 0; b < iGRIDHEIGHT; b++)
	{
	var _device = global.inputs[# iDEVICE, b];
	var _button = global.inputs[# iBUTTONID, b];
	switch(_device)
		{
		case iKEYBOARD:
			{
			global.inputs[# iPRESSED, b] = global.input_buffer[| b] || keyboard_check_pressed(_button);
			global.inputs[# iHELD, b] = keyboard_check(_button);
			global.inputs[# iRELEASED, b] = keyboard_check_released(_button);
			break;
			};
		case iMOUSE:
			{
			global.inputs[# iPRESSED, b] = global.input_buffer[| b] || mouse_check_button_pressed(_button);
			global.inputs[# iHELD, b] = mouse_check_button(_button);
			global.inputs[# iRELEASED, b] = mouse_check_button_released(_button);
			break;
			};
		case iNODEVICE:
			{
			global.inputs[# iPRESSED, b] = false;
			global.inputs[# iHELD, b] = false;
			global.inputs[# iRELEASED, b] = false;
			break;
			};
		default: //gamepads
			{
			if(_button >= gp_stickLleft && _button <= gp_stickRdown)
				{
				global.inputs[# iPRESSED, b] = global.input_buffer[| b] || fnAnalogueCheckPressed(_device, _button);
				global.inputs[# iHELD, b] = fnAnalogueCheck(_device, _button);
				global.inputs[# iRELEASED, b] = fnAnalogueCheckReleased(_device, _button);
				};
			else
				{
				global.inputs[# iPRESSED, b] = global.input_buffer[| b] || gamepad_button_check_pressed(_device, _button);
				global.inputs[# iHELD, b] = gamepad_button_check(_device, _button);
				global.inputs[# iRELEASED, b] = gamepad_button_check_released(_device, _button);
				};
			break;
			};
		};
	/*if(global.inputs[# iPRESSED, b] == true || global.inputs[# iRELEASED, b] == true)
		{global.input_buffer[| b] = false;};*/
	};
