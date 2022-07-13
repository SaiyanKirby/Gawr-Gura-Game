/// @description Function declarations

fnActorCollide = function(_x = 0, _y = 0)
	{
	if(_y <= 0 || _y >= room_height)//hitting the edges of the room
		{return true;};
	var _collided = false;
	ds_list_clear(collisions);
	var _number = instance_place_list(_x, _y, objSolidTile, collisions, true);
	if(_number > 0)
		{
		for(var i = 0; i < ds_list_size(collisions); i++)
			{
			_collided = place_meeting(_x, _y, collisions[|i]) && !place_meeting(x, y, collisions[|i]);
			//dont consider collisions if you're already inside an object ^
			if(_collided = true)
				{
				return true;
				break;
				};
			};
		};
	else
		{return false;};
	};

fnActorIsAirborne = function()
	{
	//an actor is airborne if they're not colliding with the ground,
	var _collide = fnActorCollide(x, y + global.gravity_dir);
	//OR if they're moving away from the ground that frame
	var _falling = sign(y_speed) = -global.gravity_dir;
	return !_collide || _falling;
	};

fnActorMove = function()
	{
	//set up temporary variables for readability
	var x_direction = sign(x_speed);
	var y_direction = sign(y_speed);
	var x_fraction = frac(x_speed);
	var y_fraction = frac(y_speed);
	var x_speed_rounded = round(x_speed - x_fraction);
	var y_speed_rounded = round(y_speed - y_fraction);
	
	//manage subpixels
	x_subpixel += x_fraction;
	while(abs(x_subpixel) >= 1)
		{
		x_speed_rounded += sign(x_subpixel);
		x_subpixel -= sign(x_subpixel);
		};
	y_subpixel += y_fraction;
	while(abs(y_subpixel) >= 1)
		{
		y_speed_rounded += sign(y_subpixel);
		y_subpixel -= sign(y_subpixel);
		};
	
	//move on the x axis
	if(x_speed_rounded != 0)
		{
		repeat(abs(x_speed_rounded))
			{
			if(fnActorCollide(x + x_direction, y))
				{
				x_speed = 0;
				x_subpixel = 0;
				break;
				};
			else
				{x += x_direction;};
			};
		};
	
	//move on the y axis
	if(y_speed_rounded != 0)
		{
		repeat(abs(y_speed_rounded))
			{
			if(fnActorCollide(x, y + y_direction))
				{
				y_speed = 0;
				y_subpixel = 0;
				break;
				};
			else
				{y += y_direction;};
			};
		};
	
	airborne = fnActorIsAirborne();
	
	//clamp final position
	x = clamp(round(x), 0, room_width);
	y = clamp(round(y), 0, room_height);
	};

fnApplyGravity = function()
	{
	//add gravity
	if(affected_by_gravity)
		{
		if(y_speed < terminal_velocity)
			{y_speed += global.gravity_constant * global.gravity_dir;};
		};
	};

fnActorIsOffScreen = function()
	{
	if(bbox_right < global.camera_x - 16 || bbox_left > global.camera_x + global.camera_width + 16){return true;};
	if(bbox_bottom < global.camera_y - 16 || bbox_top > global.camera_y + global.camera_height + 16){return true;};
	return false;
	};