if(!instance_exists(_parent))
	{exit;};

if(lerped_percent > 0.01 && lerped_percent < 0.99)
	{
	var total_width = width * _parent.max_hp;
	var xx = x + x_offset - ceil(total_width/2);
	var yy = y + y_offset;
	
	draw_set_color(c_black);
	draw_rectangle(xx, yy-1, xx+total_width+1, yy+height+1, false);
	draw_set_color(c_white);
	if(lerped_percent >= hp_percent)
		{
		//highlight
		draw_rectangle_color(xx+1, yy, xx+(total_width * lerped_percent), yy+(height/2), c3, c3, c3 , c3, false);
		draw_rectangle_color(xx+1, yy, xx+(total_width * hp_percent), yy+(height/2), c1, c1, c1 , c1, false);
		//darker tone
		draw_rectangle_color(xx+1, yy+(height/2)+0.5, xx+(total_width * lerped_percent), yy+height, c4, c4, c4 , c4, false);
		draw_rectangle_color(xx+1, yy+(height/2)+0.5, xx+(total_width * hp_percent), yy+height, c2, c2, c2 , c2, false);
		};
	else
		{
		//highlight
		draw_rectangle_color(xx+1, yy, xx+(total_width * hp_percent), yy+(height/2), c3, c3, c3 , c3, false);
		draw_rectangle_color(xx+1, yy, xx+(total_width * lerped_percent), yy+(height/2), c1, c1, c1 , c1, false);
		//darker tone
		draw_rectangle_color(xx+1, yy+(height/2)+0.5, xx+(total_width * hp_percent), yy+height, c4, c4, c4 , c4, false);
		draw_rectangle_color(xx+1, yy+(height/2)+0.5, xx+(total_width * lerped_percent), yy+height, c2, c2, c2 , c2, false);
		};
	draw_set_color(c_black);
	for(var i = 1; i <= _parent.max_hp; i++)
		{draw_rectangle(xx+(i*width), yy, xx+(i*width), yy+height, false);};
	draw_set_color(c_white);
	draw_sprite(sprEnemyHealthBarSmall,0,xx,yy+ceil(height/2));
	draw_sprite(sprEnemyHealthBarSmall,1,xx+total_width+1,yy+ceil(height/2));
	};
