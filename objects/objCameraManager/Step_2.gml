/// @description Move Camera

if(global.guiActive)
	{exit;};

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
if(global.camera_width < room_width)
	{camera_x = clamp(x,(global.camera_width/2),(room_width-(global.camera_width/2)));};
else
	{camera_x = room_width/2;};
if(global.camera_height < room_height)
	{camera_y = clamp(y,(global.camera_height/2),(room_height-(global.camera_height/2)));};
else
	{camera_y = room_height/2;};

//set hud position
global.HUD_x = camera_x-(global.camera_width/2);
global.HUD_y = camera_y-(global.camera_height/2);
//actually set the camera position
camera_set_view_pos(camera, camera_x - floor(global.camera_width/2), camera_y - floor(global.camera_height/2))
