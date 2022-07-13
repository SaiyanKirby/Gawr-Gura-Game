event_inherited();

image_speed = 0;

/*rainbow_outline_angle = 360;
surface = surface_create(64, 64);*/

enum gura_states
	{
	idle,
	running,
	airborne,
	attack_neutral,
	attack_down,
	attack_up,
	};

_healthbar = instance_create_depth(0, 0, 0, objGuraHealthBar);
_healthbar._parent = self;
alarm[0] = hp_regen_time//by default, regen 1 hp every 2 seconds

enemies_contacting = ds_list_create();