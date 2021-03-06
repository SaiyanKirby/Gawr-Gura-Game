draw_sprite_stretched(sprGUIWindow9Slice, 0, x - padding, y - padding, width + (padding*2), height + (padding*2));

draw_set_halign(fa_center);
draw_text(x + (width/2), y, "- Remap Controls -");

draw_sprite_stretched(sprGUIWindow9Slice, 0, x - padding, y + (height*3) - padding, width + (padding*2), (height*11) + (padding*2));

draw_set_halign(fa_left);
draw_text(x + (width/2) - 16, y + (height*3), fnGetButtonName(iLEFT));
draw_text(x + (width/2) - 16, y + (height*4), fnGetButtonName(iRIGHT));
draw_text(x + (width/2) - 16, y + (height*5), fnGetButtonName(iUP));
draw_text(x + (width/2) - 16, y + (height*6), fnGetButtonName(iDOWN));
draw_text(x + (width/2) - 16, y + (height*7), fnGetButtonName(iJUMP));
draw_text(x + (width/2) - 16, y + (height*8), fnGetButtonName(iATTACK));
draw_text(x + (width/2) - 16, y + (height*10), fnGetButtonName(iCONFIRM));
draw_text(x + (width/2) - 16, y + (height*11), fnGetButtonName(iBACK));
draw_text(x + (width/2) - 16, y + (height*12), fnGetButtonName(iPAUSE));

draw_text(x + height, y + (height*3), "Left:\nRight:\nUp:\nDown:\nJump:\nAttack:\n\nConfirm:\nBack:\nPause:\n[Back]");

var _cursor_y = selection * height;
if(selection >= 7)
	{_cursor_y += height;};
draw_sprite(sprGUICursor, 0, x + 20 + (sin(timer / 10) * 4), y + (height*2) + 16 + (_cursor_y))