function fnListInstances()
	{
	var str = "Instances:\n";
	var list = ds_list_create();
	var found = false;
	var array = [];
	var _name = "";
	var _count = 1;
	for(var i = 0; i < instance_count; i++;)
		{
		var _obj = instance_id_get(i);
		if(instance_exists(_obj))
			{
			_name = string(object_get_name(_obj.object_index));
			if(ds_list_empty(list))
				{
				array = [_name,1,_obj.id];
				ds_list_add(list,array);
				};
			else
				{
				found = false;
				for(var j = 0; j < ds_list_size(list); j++)
					{
					array = list[|j];
					if(array[@0] == _name)
						{
						list[|j] = [_name,array[@1]+1];
						found = true;
						//break;
						};
					};
				if(!found)
					{
					array = [_name,1,_obj.id];
					ds_list_add(list,array)};
				};
			};
		};
	if(ds_list_empty(list))
		{str += "...none?";};
	else
		{
		for(var k = 0; k < ds_list_size(list); k++)
			{
			array = list[|k];
			_name = array[@0];
			_count = array[@1];
			if(_count > 1)
				{str += _name + " (x" + string(_count) + ")\n";}
			else
				{str += _name + " (ID #" + string(array[@2]) + ")\n";}
			};
		};
	
	//clean up
	for(var l = 0; l < ds_list_size(list); l++)
		{list[|l] = 0};
	ds_list_destroy(list);
	
	return str;
	}

function fnSortGUIStack()
	{
	for(var i = 0; i < ds_list_size(global.guiStack); i++)
		{
		var _window = global.guiStack[|i];
		if(instance_exists(_window))
			{_window.depth = 1010 - (i * 10);};
		else
			{ds_list_delete(global.guiStack, i);};
		};
	};
