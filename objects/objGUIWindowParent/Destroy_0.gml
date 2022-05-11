//remove from the gui stack
var _pos = ds_list_find_index(global.guiStack, self)
if(_pos > -1)
	{ds_list_delete(global.guiStack, _pos);};

//clear any child objects
if(ds_exists(children, ds_type_list))
	{
	if(!ds_list_empty(children))
		{
		for(var i = 0; i < ds_list_size(children); i++)
			{
			if(instance_exists(children[|i]))
				{instance_destroy(children[|i])};
			};
		};
	ds_list_destroy(children);
	};

fnSortGUIStack();
