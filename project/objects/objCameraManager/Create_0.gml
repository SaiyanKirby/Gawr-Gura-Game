camera = camera_create();

image_speed = 0;
image_alpha = 0;

global.resolution_width = 240;
global.resolution_height = 135;
global.scale = 4;

global.resolution_width_Rendered = global.resolution_width * global.scale;
global.resolution_height_Rendered = global.resolution_height * global.scale;

spd = 0.1;
follow = noone;

x_to = x;
y_to = y;

camera_x = x;
camera_y = y;

global.HUD_x = x;
global.HUD_y = y;
global.HUD_width = global.resolution_width_Rendered;
global.HUD_height = global.resolution_height_Rendered;

display_set_gui_size(global.HUD_width, global.HUD_height);

camera = camera_create_view(0,0, global.resolution_width, global.resolution_height);
view_set_camera(0, camera);
