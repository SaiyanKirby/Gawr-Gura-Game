event_inherited();

_healthbar = instance_create_depth(x, y, depth-10, objEnemyHealthBar);
_healthbar._parent = self;

spawn_x = x;
spawn_y = y;