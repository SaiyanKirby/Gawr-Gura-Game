if(iframes > 0 && iframes % 4 > 1)
	{image_alpha = 0.1;};
else
	{image_alpha = 1;};

draw_self();
with(trident_object)
	{draw_self();};

/*
var y_offset = ((bbox_bottom - bbox_top) / 2) * global.gravity_dir;

if(!surface_exists(surface))
	{surface = surface_create(64,64);};
surface_set_target(surface);
draw_clear_alpha(c_white, 0);
draw_sprite_ext(sprite_index, image_index, 32, 32 + y_offset, image_xscale, image_yscale, image_angle, image_blend, 1);
with(trident_object)
	{draw_sprite_ext(sprite_index, image_index, 32, 32 + y_offset, image_xscale, image_yscale, image_angle, image_blend, 1);};
surface_reset_target();


shader_set(shdOutlineRainbow);
var shader_Outline_W = shader_get_uniform(shdOutlineRainbow,"PixelW");
var shader_Outline_H = shader_get_uniform(shdOutlineRainbow,"PixelH");
var shader_Outline_Timer = shader_get_uniform(shdOutlineRainbow,"Timer");
shader_set_uniform_f(shader_Outline_W, 64);
shader_set_uniform_f(shader_Outline_H, 64);
shader_set_uniform_f(shader_Outline_Timer, rainbow_outline_angle);
draw_surface(surface, x - 32, y - 32 - y_offset);
shader_reset();

draw_set_alpha(image_alpha);
draw_surface(surface, x - 32, y - 32 - y_offset);
draw_set_alpha(1);
*/