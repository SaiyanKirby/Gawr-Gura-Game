if(!instance_exists(_parent))
	{exit;};

var xx = global.HUD_x + 16;
var yy = global.HUD_y + 8;
var total_width = _parent.max_hp * width;

draw_set_color(c_black);
draw_rectangle(xx, yy-1, xx+total_width+1, yy+height+1, false);
draw_set_color(c_white);

draw_rectangle_color(xx+1, yy, xx+total_width, yy+(height/2), c5, c5, c5, c5, false);
draw_rectangle_color(xx+1, yy+(height/2)+0.5, xx+total_width, yy+height, c6, c6, c6, c6, false);
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

/*
//draw health as numbers
draw_set_color(c1);
draw_set_halign(fa_right);
draw_text_transformed(xx-6, yy-6, string(_parent.hp), 0.5, 0.5, 0);
draw_set_halign(fa_left)
draw_text_transformed(xx-6, yy-6, "/", 0.5, 0.5, 0);
draw_text_transformed(xx-2, yy-6, string(_parent.max_hp), 0.5, 0.5, 0);
*/

draw_set_color(c_white);
draw_sprite(sprGuraHealthBar,0,xx-1,yy+ceil(height/2));
draw_sprite(sprGuraHealthBar,1,xx+total_width+6,yy+ceil(height/2));
