global.gravity_dir = 1;
global.gravity_constant = 0.125;
global.air_friction_constant = 0.1;

collisions = ds_list_create();

//function delcarations
event_perform(ev_other, ev_user0);