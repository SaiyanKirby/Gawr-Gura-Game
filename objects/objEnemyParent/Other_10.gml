/// @description Function Declarations

event_inherited();

/*
Hitbox vs Hurtbox:

The player takes damage on contacting an enemy's HURTbox
The enemy takes damage when the player's attacks connect with its HITbox

The HITbox gets HIT
The HURTbox HURTS

Yes I know these are backwards from how fighting games do it
but I already wrote the code this way so shut up
*/

fnHurtEnemy = function(_damage = 1, _knockback_x = 1, _knockback_y = -1, _knockback_time, _hitbox_disable_time = 30)
	{
	if(!hitbox_active)
		{return false;};

	var damage_number = instance_create_depth(x, bbox_top, depth-10, objDamageNumber)
	damage_number.damage = _damage;
	damage_number.x_speed = sign(_knockback_x) / 2;
	
	hp -= _damage;
	if(hp > 0)
		{
		knockback_time = _knockback_time;
		x_speed += _knockback_x * knockback_resistance;
		y_speed += _knockback_y * knockback_resistance;
		hitbox_active = false;
		alarm[1] = _hitbox_disable_time;
		return true;
		};
	else
		{
		fnEnemyDie();
		return true;
		};
	};

fnEnemyDie = function()
	{
	//death code
	hurtbox_active = false;
	hitbox_active = false;
	var v_center = bbox_bottom - ((bbox_bottom - bbox_top)/2);
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