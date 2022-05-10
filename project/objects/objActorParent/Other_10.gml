/// @description Function declarations

function fnActorMove()
	{
	//set up temporary variables for readability
	var x_fraction = frac(x_speed);
	var y_fraction = frac(y_speed);
	var x_speed_rounded = round(x_speed - x_fraction);
	var y_speed_rounded = round(y_speed - y_fraction);
	var x_direction = sign(x_speed);
	var y_direction = sign(y_speed);
	
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
			if(place_meeting(x + x_direction, y, objSolidTile))
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
			if(place_meeting(x, y + y_direction, objSolidTile))
				{
				y_speed = 0;
				y_subpixel = 0;
				break;
				};
			else
				{y += y_direction;};
			};
		};
	
	//clamp final position
	x = clamp(x, 0, room_width);
	y = clamp(y, 8, room_height);
	};

function fnApplyGravity()
	{
	//add gravity
	if(!place_meeting(x, y+1, objSolidTile) && y_speed < terminal_velocity)
		{y_speed += global.gravity_constant;};
	};
