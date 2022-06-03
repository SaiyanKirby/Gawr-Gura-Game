if(show_camera)
	{
	with(objCameraManager)
		{
		draw_set_alpha(0.5)
		draw_sprite(sprCameraManager,0,x,y);
		draw_set_color(c_black)
		draw_line(x, y, x_to, y_to);
		draw_set_alpha(1.0);
		draw_rectangle(x_to, y_to, x_to+1, y_to+1, true);
		draw_set_color(c_white)
		};
	};

if(show_hitboxes)
	{
	with(objGura)
		{draw_rectangle_color(bbox_left,bbox_top,bbox_right-1,bbox_bottom-1,c_red,c_red,c_red,c_red,true);};
	with(objGura.trident_object)
		{
		if(hitbox_active)
			{draw_rectangle_color(bbox_left,bbox_top,bbox_right-1,bbox_bottom-1,c_red,c_red,c_red,c_red,true);};
		};
	with(objEnemyParent)
		{
		if(hitbox_active)
			{draw_rectangle_color(bbox_left,bbox_top,bbox_right-1,bbox_bottom-1,c_red,c_red,c_red,c_red,true);};
		};
	};
