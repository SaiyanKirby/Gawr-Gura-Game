//only run if this is the active window
if(global.guiStack[| ds_list_size(global.guiStack)-1] != self)
	{exit;};

if(keyboard_check_pressed(vk_anykey))
	{
	if(keyboard_lastkey < vk_f1 || keyboard_lastkey > vk_f12)//prevent binding to the function keys
		{
		if(global.inputs[# iDEVICE, button_to_remap] == iKEYBOARD && global.inputs[# iBUTTONID, button_to_remap] == keyboard_lastkey)
			{
			global.inputs[# iDEVICE, button_to_remap] = iNODEVICE;
			global.inputs[# iBUTTONID, button_to_remap] = 0;
			}
		else
			{
			global.inputs[# iDEVICE, button_to_remap] = iKEYBOARD;
			global.inputs[# iBUTTONID, button_to_remap] = keyboard_lastkey;
			};
		instance_destroy();
		};
	};

if(mouse_check_button_pressed(mb_any))
	{
	if(global.inputs[# iDEVICE, button_to_remap] == iMOUSE && global.inputs[# iBUTTONID, button_to_remap] == mouse_lastbutton)
		{
		global.inputs[# iDEVICE, button_to_remap] = iNODEVICE;
		global.inputs[# iBUTTONID, button_to_remap] = 0;
		}
	else
		{
		global.inputs[# iDEVICE, button_to_remap] = iMOUSE;
		global.inputs[# iBUTTONID, button_to_remap] = mouse_lastbutton
		};
	instance_destroy();
	};

//check gamepads
for(var i = 0; i < 4; i++)
	{
	var _button_pressed = -100;
	if(gamepad_button_check_pressed(i, gp_face1)){_button_pressed = gp_face1;};
	if(gamepad_button_check_pressed(i, gp_face2)){_button_pressed = gp_face2;};
	if(gamepad_button_check_pressed(i, gp_face3)){_button_pressed = gp_face3;};
	if(gamepad_button_check_pressed(i, gp_face4)){_button_pressed = gp_face4;};
	if(gamepad_button_check_pressed(i, gp_shoulderlb)){_button_pressed = gp_shoulderlb;};
	if(gamepad_button_check_pressed(i, gp_shoulderl)){_button_pressed = gp_shoulderl;};
	if(gamepad_button_check_pressed(i, gp_shoulderrb)){_button_pressed = gp_shoulderrb;};
	if(gamepad_button_check_pressed(i, gp_shoulderr)){_button_pressed = gp_shoulderr;};
	if(gamepad_button_check_pressed(i, gp_select)){_button_pressed = gp_select;};
	if(gamepad_button_check_pressed(i, gp_start)){_button_pressed = gp_start;};
	if(gamepad_button_check_pressed(i, gp_stickl)){_button_pressed = gp_stickl;};
	if(gamepad_button_check_pressed(i, gp_stickr)){_button_pressed = gp_stickr;};
	if(gamepad_button_check_pressed(i, gp_padu)){_button_pressed = gp_padu;};
	if(gamepad_button_check_pressed(i, gp_padd)){_button_pressed = gp_padd;};
	if(gamepad_button_check_pressed(i, gp_padl)){_button_pressed = gp_padl;};
	if(gamepad_button_check_pressed(i, gp_padr)){_button_pressed = gp_padr;};
	
	if(_button_pressed != -100)
		{
		if(global.inputs[# iDEVICE, button_to_remap] == i && global.inputs[# iBUTTONID, button_to_remap] == _button_pressed)
			{
			global.inputs[# iDEVICE, button_to_remap] = i;
			global.inputs[# iBUTTONID, button_to_remap] = 0;
			}
		else
			{
			global.inputs[# iDEVICE, button_to_remap] = i;
			global.inputs[# iBUTTONID, button_to_remap] = _button_pressed
			};
		instance_destroy();
		};
	};