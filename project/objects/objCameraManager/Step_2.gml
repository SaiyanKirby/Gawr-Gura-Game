/// @description Move Camera

/*if global.game_state != game_states.main
	{exit;};*/

//follow an instance
if(instance_exists(follow))
	{
	x_to = follow.bbox_left+((follow.bbox_right-follow.bbox_left)/2);
	y_to = follow.bbox_top+((follow.bbox_bottom-follow.bbox_top)/2);
	};

//move camera x/y towards follow
if(abs(x-x_to) < 0.01)
	{x = x_to;};
else
	{x = lerp(x,x_to,spd);};
if(abs(y-y_to) < 0.01)
	{y = y_to;};
else
	{y = lerp(y,y_to,spd);};

//clamp to within bounds of the room size
if(global.resolution_width < room_width)
	{x = clamp(x,(global.resolution_width/2),(room_width-(global.resolution_width/2)));};
else
	{x = room_width/2;};
if(global.resolution_height < room_height)
	{y = clamp(y,(global.resolution_height/2),(room_height-(global.resolution_height/2)));};
else
	{y = room_height/2;};

//actually set the camera position
camera_x = x;
camera_y = y;
global.HUD_x = camera_x-(global.resolution_width/2);
global.HUD_y = camera_y-(global.resolution_height/2);
camera_set_view_pos(camera, x - floor(global.resolution_width/2), y - floor(global.resolution_height/2))
