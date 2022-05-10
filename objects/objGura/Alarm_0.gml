///@description Health regen

if(hp < max_hp)
	{
	var damage_number = instance_create_depth(x, bbox_top, depth-10, objDamageNumber)
	damage_number.damage = -1;
	};

hp = clamp(hp+1, 0, max_hp);

alarm[0] = hp_regen_time;
