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
