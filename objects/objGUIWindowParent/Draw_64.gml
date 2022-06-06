//only run if this is the active window
if(global.guiStack[| ds_list_size(global.guiStack)-1] != self)
	{exit;};

draw_sprite_stretched(sprGUIWindow9Slice, 0, x - padding, y - padding, width + (padding*2), height + (padding*2));
draw_text(x, y, text);