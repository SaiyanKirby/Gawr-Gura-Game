camera = camera_create();

image_speed = 0;
image_alpha = 0;

spd = 0.1;
follow = noone;

x_to = x;
y_to = y;

global.camera_x = x;
global.camera_y = y;

global.screen_shake = 0;
global.hitstop = 0;

camera = camera_create_view(0,0, global.camera_width, global.camera_height);
view_set_camera(0, camera);