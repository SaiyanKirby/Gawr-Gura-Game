event_inherited();

x = 288;
y = 32;

timer = 0; //for animating the cursor

button_display_type = 0;
/*
for the face buttons of controllers
0 = xbox
1 = playstation
2 = switch
*/

function fnGetButtonName(_button = 0)
	{
	switch(global.inputs[# iDEVICE, _button])
		{
		case iNODEVICE:
			{return "[Not Bound]";};
		case iKEYBOARD: // keyboard
			{
			var _key = global.inputs[# iBUTTONID, _button];
			switch(_key)
				{
				case vk_left:{return "Left";};
				case vk_right:{return "Right";};
				case vk_up:{return "Up";};
				case vk_down:{return "Down";};
				case vk_enter:{return "Enter";};
				case vk_escape:{return "Escape";};
				case vk_space:{return "Space";};
				case vk_shift:{return "Shift";};
				case vk_control:{return "Control";};
				case vk_alt:{return "Alt";};
				case vk_backspace:{return "Back";};
				case vk_tab:{return "Tab";};
				case vk_home:{return "Home";};
				case vk_end:{return "End";};
				case vk_delete:{return "Delete";};
				case vk_insert:{return "Insert";};
				case vk_pageup:{return "Pg Up";};
				case vk_pagedown:{return "Pg Down";};
				case vk_pause:{return "Pause";};
				case vk_printscreen:{return "PrntScrn";};
				case vk_multiply:{return "*";};
				case vk_divide:{return "/";};
				case vk_add:{return "+";};
				case vk_subtract:{return "-";};
				case vk_decimal:{return ".";};
				case vk_numpad0:{return "Numpad 0";};
				case vk_numpad1:{return "Numpad 1";};
				case vk_numpad2:{return "Numpad 2";};
				case vk_numpad3:{return "Numpad 3";};
				case vk_numpad4:{return "Numpad 4";};
				case vk_numpad5:{return "Numpad 5";};
				case vk_numpad6:{return "Numpad 6";};
				case vk_numpad7:{return "Numpad 7";};
				case vk_numpad8:{return "Numpad 8";};
				case vk_numpad9:{return "Numpad 9";};
				};
			if(_key >= 0 && _key < 128)
				{return chr(_key);};
			};
		case iMOUSE: // mouse
			{
			switch(global.inputs[# iBUTTONID, _button])
				{
				case mb_left:{return "M1";};
				case mb_right:{return "M2";};
				case mb_middle:{return "M3";};
				case mb_side1:{return "M4";};
				case mb_side2:{return "M5";};
				};
			};
		default: // gamepad
			{
			switch(global.inputs[# iBUTTONID, _button])
				{
				case gp_face1:
					{
					if(button_display_type == 0){return "(A)";};
					if(button_display_type == 1){return "(X)";};
					if(button_display_type == 2){return "(B)";};
					};
				case gp_face2:
					{
					if(button_display_type == 0){return "(B)";};
					if(button_display_type == 1){return "(Circle)";};
					if(button_display_type == 2){return "(A)";};
					};
				case gp_face3:
					{
					if(button_display_type == 0){return "(X)";};
					if(button_display_type == 1){return "(Square)";};
					if(button_display_type == 2){return "(Y)";};
					};
				case gp_face4:
					{
					if(button_display_type == 0){return "(Y)";};
					if(button_display_type == 1){return "(Triangle)";};
					if(button_display_type == 2){return "(X)";};
					};
				case gp_shoulderlb:{return "(L1)";};
				case gp_shoulderl:{return "(L2)";};
				case gp_shoulderrb:{return "(R1)";};
				case gp_shoulderr:{return "(R2)";};
				
				case gp_select:{return "(Select)";};
				case gp_start:{return "(Start)";};
				
				case gp_stickl:{return "(L3)";};
				case gp_stickr:{return "(R3)";};
				
				case gp_padu:{return "(DPad Up)";};
				case gp_padd:{return "(DPad Down)";};
				case gp_padl:{return "(Dpad Left)";};
				case gp_padr:{return "(DPad Right)";};
				
				case gp_stickLleft:{return "(LS Left)";};
				case gp_stickLright:{return "(LS Right)";};
				case gp_stickLup:{return "(LS Up)";};
				case gp_stickLdown:{return "(LS Down)";};
				
				case gp_stickRleft:{return "(RS Left)";};
				case gp_stickRright:{return "(RS Right)";};
				case gp_stickRup:{return "(RS Up)";};
				case gp_stickRdown:{return "(RS Down)";};
				};
			};
		};
	return "[Unknown?]";
	};