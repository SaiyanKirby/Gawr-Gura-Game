event_inherited();

width = string_width(text);
height = string_height(text);

//positions are in GUI-space
x = (global.HUD_width/2) - (width/2);
y = (global.HUD_height/2) - (height/2);

button_to_remap = vk_nokey;

function fnRemapButton(_button_to_remap, _new_device, _new_button)
	{
	//check if that button is already used for menus, and if so, swap them
	//confirm cannot be bound to the same key as pause or back,
	//though pause and back can share a key and shouldn't cause issues
	var _old_device = global.inputs[# iDEVICE, _button_to_remap];
	var _old_button = global.inputs[# iBUTTONID, _button_to_remap];
	if(_button_to_remap == iCONFIRM)
		{
		if(global.inputs[# iDEVICE, iBACK] == _new_device && global.inputs[# iBUTTONID, iBACK] == _new_button)
			{
			global.inputs[# iDEVICE, iBACK] = _old_device;
			global.inputs[# iBUTTONID, iBACK] = _old_button;
			};
		if(global.inputs[# iDEVICE, iPAUSE] == _new_device && global.inputs[# iBUTTONID, iPAUSE] == _new_button)
			{
			global.inputs[# iDEVICE, iPAUSE] = _old_device;
			global.inputs[# iBUTTONID, iPAUSE] = _old_button;
			};
		};
	if(_button_to_remap == iBACK || _button_to_remap == iPAUSE)
		{
		if(global.inputs[# iDEVICE, iCONFIRM] == _new_device && global.inputs[# iBUTTONID, iCONFIRM] == _new_button)
			{
			//if swapping buttons for confirm, and back/pause are the same, swap both
			if(global.inputs[# iDEVICE, iBACK] == global.inputs[# iDEVICE, iPAUSE] && global.inputs[# iBUTTONID, iBACK] == global.inputs[# iBUTTONID, iPAUSE])
				{
				global.inputs[# iDEVICE, iPAUSE] = _new_device;
				global.inputs[# iBUTTONID, iPAUSE] = _new_button;
				global.inputs[# iDEVICE, iBACK] = _new_device;
				global.inputs[# iBUTTONID, iBACK] = _new_button;
				};
			global.inputs[# iDEVICE, iCONFIRM] = _old_device;
			global.inputs[# iBUTTONID, iCONFIRM] = _old_button;
			};
		};
	global.inputs[# iDEVICE, _button_to_remap] = _new_device;
	global.inputs[# iBUTTONID, _button_to_remap] = _new_button;
	};