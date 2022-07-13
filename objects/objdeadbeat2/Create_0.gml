hitbox_active = false;
hurtbox_active = false;
moving = false;
alive = false;

swing_hitbox = instance_create_depth(x, y, depth, objDeadbeat2SwingHurtbox);

state = -1;
/*
states:
-2: on a timer before it can respawn
-1: dead but able to rise from the grave
 0: alive, idle
 1: attacking
*/

image_index = 0;
image_speed = 0;

dir = 1;

animation_timer = -1;
rise_grave_time = 45;

alert_distance = 80;

event_inherited();