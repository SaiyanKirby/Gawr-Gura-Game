if(!alive)
	{
	if(state == -1 && alert_timer > 0)
		{
		var _height = sprite_height * (alert_timer / rise_grave_time);
		var _x = bbox_left + (alert_timer % 4 > 1);
		var _y = y - _height;
		draw_sprite_part(sprite_index, image_index, 0, 0, abs(sprite_width), _height, _x, _y);
		};
	};
else
	{draw_self();};