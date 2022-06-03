fnClearInputs();

//remove from the gui stack
var _pos = ds_list_find_index(global.guiStack, self)
if(_pos > -1)
	{ds_list_delete(global.guiStack, _pos);};

fnSortGUIStack();