//only run if this is the active window
if(global.guiStack[| ds_list_size(global.guiStack)-1] != self)
	{exit;};

if(global.inputs[# iPRESSED, iBACK] || global.inputs[# iPRESSED, iPAUSE])
	{
	keyboard_clear(vk_escape);
	global.inputs[# iPRESSED, iBACK] = false;
	global.inputs[# iPRESSED, iPAUSE] = false;
	instance_destroy();
	};

//for animating the cursor
timer++;
if(timer >= 60)
	{timer = 0;};

if(global.inputs[# iPRESSED, iUP])
	{
	selection--;
	if(selection < 1)
		{selection = selections;};
	};
if(global.inputs[# iPRESSED, iDOWN])
	{
	selection++;
	if(selection > selections)
		{selection = 1;};
	};

if(global.inputs[# iPRESSED, iCONFIRM])
	{
	if(selection == 10)
		{instance_destroy()}
	else
		{
		var _window = instance_create_depth(0, 0, -1000, objGUIRemapControls);
		_window.button_to_remap = selection - 1;
		};
	};