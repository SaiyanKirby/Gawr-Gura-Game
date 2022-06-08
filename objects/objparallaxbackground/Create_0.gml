background_layer = layer_create(depth);
background = layer_background_create(background_layer, sprite_index);
layer_background_index(background, image_index);
layer_background_speed(background, 0);
layer_background_htiled(background, tiled_x);
layer_background_vtiled(background, tiled_y);

function fnMoveParallaxLayer()
	{
	layer_background_index(background, image_index);
	layer_background_speed(background, 0);
	layer_background_htiled(background, tiled_x);
	layer_background_vtiled(background, tiled_y);
		
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

	layer_depth(background_layer, depth);
	layer_x(background_layer, x + offset_x + ((global.HUD_x - x) * parallax_x));
	layer_y(background_layer, y + offset_y + ((global.HUD_y - y) * parallax_y));
	};