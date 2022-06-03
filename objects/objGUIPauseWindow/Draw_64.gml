var xx = x - (width/2);
var yy = y - (height * 3);

//draw "game paused" window
draw_sprite_stretched(sprGUIWindow9Slice, 0, xx - padding, yy - padding, width + (padding*2), height + (padding*2));

draw_set_halign(fa_center);
draw_text(x, yy, "- Game Paused -");

//draw "resume" / "options" / "quit"
yy += (height * 2) + (padding * 2);
draw_sprite_stretched(sprGUIWindow9Slice, 0, xx - padding, yy - padding, width + (padding*2), (height*3) + (padding*2));

draw_set_halign(fa_left);
draw_text(xx + 32, yy, "Resume\nOptions\nQuit Game");

draw_sprite(sprGUICursor, 0, xx + 24 + (sin(timer / 10) * 4), yy - 16 + (selection * 32))