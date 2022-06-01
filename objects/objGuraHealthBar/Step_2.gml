if(!instance_exists(_parent))
	{
	instance_destroy(self);
	exit;
	};

hp_percent = clamp(_parent.hp/_parent.max_hp, 0, 1);

lerped_percent = lerp(lerped_percent, hp_percent, 0.1);
if(abs(lerped_percent - hp_percent) < 0.001)
	{lerped_percent = hp_percent;};
