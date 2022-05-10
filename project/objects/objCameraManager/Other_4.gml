if(follow == noone || !instance_exists(follow))
	{follow = objGura;};
if(instance_exists(follow))
	{
	x = follow.bbox_left+((follow.bbox_right-follow.bbox_left)/2);
	y = follow.bbox_top+((follow.bbox_bottom-follow.bbox_top)/2);
	};
else
	{
	x = 0;
	y = 0;
	};

camera = camera_create_view(x,y, global.resolution_width, global.resolution_height);
view_set_camera(0, camera);

camera_set_view_pos(camera, x - floor(global.resolution_width/2), y - floor(global.resolution_height/2))
