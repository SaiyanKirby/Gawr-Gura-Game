/// @description Move Camera

if(layer_exists("ScreenShake"))
	{
	var screenshake_layer = layer_get_id("ScreenShake");
	var screenshake_fx = layer_get_fx(screenshake_layer);
	fx_set_parameter(screenshake_fx, "g_Magnitude", global.screen_shake);
	if(global.guiActive)
		{layer_set_visible(screenshake_layer, false);};
	else
		{layer_set_visible(screenshake_layer, true);};
	};

if(global.guiActive)
	{exit;};

if(global.hitstop > 0)
	{global.hitstop--;};

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
	{global.camera_x = clamp(x - (global.camera_width/2), 0, room_width - global.camera_width);};
else
	{global.camera_x = (room_width/2) - (global.camera_width/2);};
if(global.camera_height < room_height)
	{global.camera_y = clamp(y - (global.camera_height/2), 0, room_height - global.camera_height);};
else
	{global.camera_y = (room_height/2) - (global.camera_height/2);};

//set hud position
global.HUD_x = global.camera_x;
global.HUD_y = global.camera_y;
//actually set the camera position
camera_set_view_size(camera, global.camera_width, global.camera_height);
camera_set_view_pos(camera, global.camera_x, global.camera_y);

with(objParallaxBackground)
	{fnMoveParallaxLayer()};

if(global.screen_shake > 0.05)
	{global.screen_shake = lerp(global.screen_shake, 0, 0.1);};
else
	{global.screen_shake = 0;};