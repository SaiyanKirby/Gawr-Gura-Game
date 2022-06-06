#macro resolution_width 240
#macro resolution_height 135

global.camera_width = resolution_width;
global.camera_height = resolution_height;
global.camera_x = x;
global.camera_y = y;

global.scale = 4;

global.screen_width = global.camera_width * global.scale;
global.screen_height = global.camera_height * global.scale;

global.HUD_x = x;
global.HUD_y = y;
global.HUD_width = global.screen_width;
global.HUD_height = global.screen_height;

display_set_gui_maximize(-1, -1);
display_set_gui_size(global.HUD_width, global.HUD_height);