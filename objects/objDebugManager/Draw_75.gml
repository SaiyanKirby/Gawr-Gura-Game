var padding = 4;
var fh = global.font_height / 2;
var fw = global.font_width / 2;
draw_set_font(global.fontDebug);

if(show_instances)
	{
	var xx = padding;
	var yy = 64;//kinda arbitrary
	draw_set_color(c_black);
	draw_set_alpha(0.5)
	var w = string_width(instances) + (padding * 2);
	var h = string_height(instances) + (fh * 2) + (padding * 2);
	draw_rectangle(0, yy, w, yy + h, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_text(xx, yy + padding, "FPS: " + string(fps) + " (" + string(fps_real) + ")");
	draw_text(xx, yy + padding + fh, "Instances: (" + string(instance_count) + ")");
	draw_text(xx, yy + padding + (fh * 2), instances);
	};

if(show_gura_info)
	{
	with(objGura)
		{
		var state_name = fnGuraGetStateName();
		var xx = padding;
		var w = (fw * 40) + (padding * 2);
		var h = (fh * 3) + (padding * 2);
		var yy = global.HUD_height - h - fh - (padding*2) - 1;
		draw_set_color(c_black);
		draw_set_alpha(0.5)
		draw_rectangle(0, yy, xx + w, yy + h, false);
		draw_set_alpha(1);
		draw_set_color(c_white)
		draw_text(xx, yy + padding,"State: " + state_name);
		draw_text(xx+(w/2), yy + padding,"Moving: " + (moving?"True":"False"));
		draw_text(xx, yy + padding + fh,"Position: " + string(x+x_subpixel) + ", " + string(y+y_subpixel));
		draw_text(xx+(w/2), yy + padding + fh,"Speed: " + string(x_speed) + ", " + string(y_speed));
		draw_text(xx, yy + padding + (fh*2),"Jumps: " + string(jumps) + "/" + string(max_jumps));
		draw_text(xx+(w/2), yy + padding + (fh*2),"Jump Hold Time: " + string(jump_hold_time));
		};
	};

var _str = "[Build_"+global.build_number+"]";
draw_set_color(c_black);
draw_set_alpha(0.5)
var h = fh + (padding * 2);
draw_rectangle(0, global.HUD_height - h, global.HUD_width, global.HUD_height, false);
draw_set_alpha(1);
draw_set_color(c_white)
draw_text(padding, global.HUD_height - h + padding, "Press F1 for the default controls. Press F2 for debug hotkeys. Press F3 to reset controls to default.");
draw_set_halign(fa_right);
draw_text(global.HUD_width-padding, global.HUD_height - h + padding, _str);
draw_set_halign(fa_left);

draw_set_font(global.fontMain);
