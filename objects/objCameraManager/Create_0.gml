camera = camera_create();

image_speed = 0;
image_alpha = 0;

spd = 0.1;
follow = noone;

x_to = x;
y_to = y;

camera_x = x;
camera_y = y;

display_set_gui_size(global.HUD_width, global.HUD_height);

camera = camera_create_view(0,0, global.resolution_width, global.resolution_height);
view_set_camera(0, camera);
