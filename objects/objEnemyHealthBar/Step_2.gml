if(!instance_exists(_parent))
	{
	instance_destroy(self);
	exit;
	};

if(_parent.alive)
	{
	x = _parent.bbox_right - ceil((_parent.bbox_right - _parent.bbox_left)/2);
	y = _parent.bbox_top;
	};

hp_percent = clamp(_parent.hp/_parent.max_hp, 0, 1);

lerped_percent = lerp(lerped_percent, hp_percent, 0.1);
if(abs(lerped_percent - hp_percent) < 0.01)
	{lerped_percent = hp_percent;};
