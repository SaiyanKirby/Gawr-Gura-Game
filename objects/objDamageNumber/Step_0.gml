y_speed += 0.05;
y += y_speed;
x += x_speed/10;

if(y_speed >= 0)
	{image_alpha -= 0.05;};

if(image_alpha <= 0)
	{instance_destroy();};
