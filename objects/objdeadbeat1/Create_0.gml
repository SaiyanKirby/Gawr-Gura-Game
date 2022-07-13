alive = false;
state = -1;
/*
states:
-2: on a timer before it can respawn
-1: dead but able to rise from the grave
 0: alive, idle
 1: alert
 2: moving
*/

image_index = 1;
image_speed = 0;

dir = 1;
movement_speed = 0.25;
last_jump_x = -1;//so he doesn't just jump forever

alert_timer = -1;
alert_distance = 80;
rise_grave_time = 45;

event_inherited();