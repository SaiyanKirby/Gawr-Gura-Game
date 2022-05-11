event_inherited();

window = instance_create_depth(0, 0, -1000, objGUIWindow);
ds_list_add(children, window);
window._parent = self;
window.text = "Game Paused";
window.width = string_width(window.text);
window.height = string_height(window.text);
//positions are in GUI-space
window.x = (global.HUD_width/2) - (window.width/2);
window.y = (global.HUD_height/2) - (window.height/2);
