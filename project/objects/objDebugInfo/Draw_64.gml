if(show_instances)
	{
	draw_set_color(c_black);
	draw_set_alpha(0.5)
	draw_rectangle(0, 64, string_width(instances) + 8, 88 + string_height(instances) + 4, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_text(4, 72, "FPS: " + string(fps) + " (" + string(fps_real) + ")");
	draw_text(4, 80, "Instances: (" + string(instance_count) + ")");
	draw_text(4, 88, instances);
	};

if(show_gura_info)
	{
	with(objGura)
		{
		var state_name = fnGetStateName();

		draw_set_color(c_black);
		draw_set_alpha(0.5)
		draw_rectangle(0, global.HUD_height-80, 420, global.HUD_height-21, false);
		draw_set_alpha(1);
		draw_set_color(c_white)
		draw_text(4,global.HUD_height-72,"State: " + state_name);
		draw_text(4+220,global.HUD_height-72,"Moving: " + (moving?"True":"False"));
		draw_text(4,global.HUD_height-52,"Position: " + string(x+x_subpixel) + ", " + string(y+y_subpixel));
		draw_text(4+220,global.HUD_height-52,"Speed: " + string(x_speed) + ", " + string(y_speed));
		draw_text(4,global.HUD_height-32,"Jumps: " + string(jumps) + "/" + string(max_jumps));
		draw_text(4+220,global.HUD_height-32,"Jump Hold Time: " + string(jump_hold_time));
		};
	};

var _str = "[b_"+global.build_number+"]";
draw_set_color(c_black);
draw_set_alpha(0.5)
draw_rectangle(0, global.HUD_height-20, global.HUD_width, global.HUD_height, false);
draw_set_alpha(1);
draw_set_color(c_white)
draw_text(4, global.HUD_height-12, "Press F1 for the basic controls. Press F2 for debug hotkeys.");
draw_set_halign(fa_right);
draw_text(global.HUD_width-4, global.HUD_height-12, _str);
draw_set_halign(fa_left);
