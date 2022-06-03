var ctrl_pressed = keyboard_check_pressed(vk_control);
var ctrl_held = keyboard_check(vk_control);

var i_pressed = keyboard_check_pressed(ord("I"));
var i_held= keyboard_check(ord("I"));

var c_pressed = keyboard_check_pressed(ord("C"));
var c_held= keyboard_check(ord("C"));

var g_pressed = keyboard_check_pressed(ord("G"));
var g_held= keyboard_check(ord("G"));

var h_pressed = keyboard_check_pressed(ord("H"));
var h_held= keyboard_check(ord("H"));

if((ctrl_pressed && i_held) || (ctrl_held && i_pressed))
	{show_instances = !show_instances;}

if((ctrl_pressed && c_held) || (ctrl_held && c_pressed))
	{show_camera = !show_camera}

if((ctrl_pressed && g_held) || (ctrl_held && g_pressed))
	{show_gura_info = !show_gura_info}

if((ctrl_pressed && h_held) || (ctrl_held && h_pressed))
	{show_hitboxes = !show_hitboxes}

if(show_instances)
	{
	if(instances_count != instance_count)
			{
			instances_count = instance_count;
			instances = fnListInstances();
			};
	};

with(objGura)
	{
	if(keyboard_check_pressed(vk_add))
		{
		max_hp = clamp(max_hp+1, 1, 20);
		hp = clamp(hp, 1, max_hp);
		};
	if(keyboard_check_pressed(vk_subtract))
		{
		max_hp = clamp(max_hp-1, 1, 20);
		hp = clamp(hp, 1, max_hp);
		};
	if(!global.guiActive && keyboard_check_pressed(ord("G")) && !ctrl_held)
		{fnSwitchGravity();};
	};

if(keyboard_check_pressed(vk_f1))
	{
	var _str =	@"- Controls -
				
Move Left: A
Move Right: D
				
Jump: Space
* - You can hold the button for a higher jump
* - You can double-jump.
				
Attack Forward: Left Mouse Button
* - The forward stab gives you a slight lift when done in the air.

Attack Downward: S while in the air
* - The downward stab bounces off of enemies and doing so refreshes your double jump.
* - Holding jump on a bounce bounces you higher
";
	show_message(_str);
	};

if(keyboard_check_pressed(vk_f2))
	{
	var _str =	@"- Debug Controls -

CTRL + i: Toggle a list of all active instances.
CTRL + c: Toggle displaying the camera object and what it's following.
CTRL + g: Toggle a display of basic state information for Gura.

W: Reverse gravity direction globally.

Numpad Plus: Increase Gura's Max HP by 1 (max 25).
Numpad Minus: Decrease Gura's Max HP by 1 (max 1).
				
F1: Opens a window showing the basic controls.
F2: Opens this window.
F3: Resets all controls to default.
";
	show_message(_str);
	};

if(keyboard_check_pressed(vk_f3))
	{fnInitializeInputs();};
