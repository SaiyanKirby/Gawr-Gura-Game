event_inherited();

width = string_width(text);
height = string_height(text);

//positions are in GUI-space
x = (global.HUD_width/2) - (width/2);
y = (global.HUD_height/2) - (height/2);

button_to_remap = vk_nokey;