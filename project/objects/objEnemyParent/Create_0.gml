event_inherited();

function fnHurtEnemy(_damage = 1, _knockback_x = 1, _knockback_y = -1, _knockback_time, _hurtbox_disable_time = 30)
	{
	if(!hitbox_active)
		{return false;};

	var v_center = bbox_bottom - ((bbox_bottom - bbox_top)/2);
	var damage_number = instance_create_depth(x, bbox_top, depth-10, objDamageNumber)
	damage_number.damage = _damage;
	damage_number.x_speed = sign(_knockback_x);
	
	hp -= _damage;
	if(hp > 0)
		{
		knockback_time = _knockback_time;
		x_speed += _knockback_x;
		y_speed += _knockback_y;
		hurtbox_active = false;
		alarm[1] = _hurtbox_disable_time;
		return true;
		}
	else
		{
		hurtbox_active = false;
		hitbox_active = false;
		instance_create_depth(x, v_center, depth-10, objEnemyDeathEffect);
		audio_play_sound(sndEnemyDeath, 0, 0);
		alive = false;
		image_alpha = 0;
		alarm[1] = -1;
		alarm[0] = respawn_time;
		x = spawn_x;
		y = spawn_y;
		return true;
		};
	};

_healthbar = instance_create_depth(x, y, depth-10, objEnemyHealthBar);
_healthbar._parent = self;

spawn_x = x;
spawn_y = y;
