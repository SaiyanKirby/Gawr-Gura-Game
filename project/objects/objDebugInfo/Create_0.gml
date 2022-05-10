global.build_number = "0004"

instances = fnListInstances();
instances_count = instance_count;

show_instances = false;
show_camera = false;

show_gura_info = false;

global.font = font_add_sprite(sprFontTiny, ord("!"), false, 1);
draw_set_font(global.font);
