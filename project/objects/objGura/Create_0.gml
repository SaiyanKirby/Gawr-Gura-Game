event_inherited();

image_speed = 0;

enum gura_states
	{
	idle,
	running,
	airborne,
	attack_neutral,
	attack_down,
	attack_up,
	};

_healthbar = instance_create_depth(0, 0, depth, objGuraHealthBar);
_healthbar._parent = self;
alarm[0] = hp_regen_time//by default, regen 1 hp every 2 seconds

enemies_contacting = ds_list_create();

//defines all of the method functions
event_perform(ev_other, ev_user0);
