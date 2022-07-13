if(global.guiActive || global.hitstop > 0)
	{exit;};

if(place_meeting(x, y, objGura) || place_meeting(x, y, objGuraTridentDown))
	{
	with(objGura)
		{
		if(y_speed > 0)
			{
			y_speed = jump_height * 1.75;
			if(global.inputs[# iHELD, iJUMP])
				{y_speed = jump_height * 2;};
			jumps = max_jumps;
			jump_hold_time = jump_hold_time_max;
			airborne_time = -1;
			var _bounce_sound = audio_play_sound(sndGuraJump,0,false);
			audio_sound_pitch(_bounce_sound, 0.25);
			other.squish = 0.5;
			};
		};
	};

if(squish > 0.01)
	{squish = lerp(squish, 0, 0.2);};
else
	{squish = 0;};