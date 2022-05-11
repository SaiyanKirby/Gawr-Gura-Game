global.resolution_width = 240;
global.resolution_height = 135;
global.scale = 4;

global.resolution_width_Rendered = global.resolution_width * global.scale;
global.resolution_height_Rendered = global.resolution_height * global.scale;

global.HUD_x = x;
global.HUD_y = y;
global.HUD_width = global.resolution_width_Rendered;
global.HUD_height = global.resolution_height_Rendered;

display_set_gui_maximize(-1, -1);
display_set_gui_size(global.HUD_width, global.HUD_height);
