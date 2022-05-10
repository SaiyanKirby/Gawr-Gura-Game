if(damage > 0)
	{draw_set_color(c_red);};
else if(damage < 0)
	{draw_set_color(c_green);};
var s = string(abs(damage));
draw_set_alpha(image_alpha);
draw_set_halign(fa_center)
draw_text(x + 2, y, s);
draw_set_halign(fa_left);
draw_set_alpha(1);
draw_set_color(c_white);
