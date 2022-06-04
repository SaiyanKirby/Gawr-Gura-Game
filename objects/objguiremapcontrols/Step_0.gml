//only run if this is the active window
if(global.guiStack[| ds_list_size(global.guiStack)-1] != self)
	{exit;};

if(keyboard_check_pressed(vk_anykey))
	{
	if(keyboard_lastkey < vk_f1 || keyboard_lastkey > vk_f12)//prevent binding to the function keys
		{
		fnRemapButton(button_to_remap, iKEYBOARD, keyboard_lastkey);
		instance_destroy();
		};
	};

if(mouse_check_button_pressed(mb_any))
	{
	fnRemapButton(button_to_remap, iMOUSE, mouse_lastbutton);
	instance_destroy();
	};

//check gamepads
var _button_pressed = -1;
var _device = 0;
for(_device = 0; _device < 4; _device++)
	{
	if(gamepad_is_connected(_device))
		{
		var _button_pressed = -1;
		if(gamepad_button_check_pressed(_device, gp_face1)){_button_pressed = gp_face1;break;};
		if(gamepad_button_check_pressed(_device, gp_face2)){_button_pressed = gp_face2;break;};
		if(gamepad_button_check_pressed(_device, gp_face3)){_button_pressed = gp_face3;break;};
		if(gamepad_button_check_pressed(_device, gp_face4)){_button_pressed = gp_face4;break;};
	
		if(gamepad_button_check_pressed(_device, gp_shoulderlb)){_button_pressed = gp_shoulderlb;break;};
		if(gamepad_button_check_pressed(_device, gp_shoulderl)){_button_pressed = gp_shoulderl;break;};
		if(gamepad_button_check_pressed(_device, gp_shoulderrb)){_button_pressed = gp_shoulderrb;break;};
		if(gamepad_button_check_pressed(_device, gp_shoulderr)){_button_pressed = gp_shoulderr;break;};
	
		if(gamepad_button_check_pressed(_device, gp_select)){_button_pressed = gp_select;break;};
		if(gamepad_button_check_pressed(_device, gp_start)){_button_pressed = gp_start;break;};
	
		if(gamepad_button_check_pressed(_device, gp_stickl)){_button_pressed = gp_stickl;break;};
		if(gamepad_button_check_pressed(_device, gp_stickr)){_button_pressed = gp_stickr;break;};
	
		if(gamepad_button_check_pressed(_device, gp_padu)){_button_pressed = gp_padu;break;};
		if(gamepad_button_check_pressed(_device, gp_padd)){_button_pressed = gp_padd;break;};
		if(gamepad_button_check_pressed(_device, gp_padl)){_button_pressed = gp_padl;break;};
		if(gamepad_button_check_pressed(_device, gp_padr)){_button_pressed = gp_padr;break;};
	
		if(fnAnalogueCheckPressed(_device, gp_stickLleft)){_button_pressed = gp_stickLleft;break;};
		if(fnAnalogueCheckPressed(_device, gp_stickLright)){_button_pressed = gp_stickLright;break;};
		if(fnAnalogueCheckPressed(_device, gp_stickLup)){_button_pressed = gp_stickLup;break;};
		if(fnAnalogueCheckPressed(_device, gp_stickLdown)){_button_pressed = gp_stickLdown;break;};
	
		if(fnAnalogueCheckPressed(_device, gp_stickRleft)){_button_pressed = gp_stickRleft;break;};
		if(fnAnalogueCheckPressed(_device, gp_stickRright)){_button_pressed = gp_stickRright;break;};
		if(fnAnalogueCheckPressed(_device, gp_stickRup)){_button_pressed = gp_stickRup;break;};
		if(fnAnalogueCheckPressed(_device, gp_stickRdown)){_button_pressed = gp_stickRdown;break;};
		};
	};
if(_button_pressed != -1)
	{
	fnRemapButton(button_to_remap, _device, _button_pressed);
	instance_destroy();
	};