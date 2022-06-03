//only run if this is the active window
if(global.guiStack[| ds_list_size(global.guiStack)-1] != self)
	{exit;};

if(global.inputs[# iPRESSED, iBACK] || global.inputs[# iPRESSED, iMENU])
	{instance_destroy();};