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

if(show_gura_info)
	{
	with(objGura)
		{
		draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_red,c_red,c_red,c_red,true);
		};
	};
