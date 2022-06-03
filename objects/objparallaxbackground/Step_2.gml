offset_x += x_speed;
offset_y += y_speed;

//wrap the background around
if(offset_x < sprite_width * -1)
	{offset_x += (global.HUD_width / global.scale) + sprite_width;};
if(offset_x > (global.HUD_width / global.scale))
	{offset_x -= (global.HUD_width / global.scale) + sprite_width;};

if(offset_y < sprite_height * -1)
	{offset_y += (global.HUD_height / global.scale) + sprite_height;};
if(offset_y > (global.HUD_height / global.scale))
	{offset_y -= (global.HUD_height / global.scale) + sprite_height;};

layer_x(background_layer, global.HUD_x + offset_x);
layer_y(background_layer, global.HUD_y + offset_y);