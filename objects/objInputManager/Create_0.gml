#region macros

#macro iGRIDWIDTH 9
#macro iGRIDHEIGHT 9

#macro iLEFT 0
#macro iRIGHT 1
#macro iUP 2
#macro iDOWN 3
#macro iJUMP 4
#macro iATTACK 5
#macro iCONFIRM 6
#macro iBACK 7
#macro iMENU 8

#macro iDEVICE 0
#macro iBUTTONID 1
#macro iPRESSED 2
#macro iHELD 3
#macro iRELEASED 4

#macro iNODEVICE -1
#macro iKEYBOARD -2
#macro iMOUSE -3

#endregion macros

global.inputs = ds_grid_create(iGRIDWIDTH, iGRIDHEIGHT);
/*
each row is one button
collumns: input device, button ID, pressed, held, released

input types:
	none = -1
	keyboard = -2
	mouse = -3
	gamepad = gamepad ID (0 and up)
*/

#region analogue stick variable/functions

/*analogue_deadzone = 0.75; //how far a stick has to be pushed to register
analogue_sticks = ds_list_create(); //track all analogue sticks
analogue_sticks_previous = ds_list_create(); //for comparing to last frame

//initialize list
for(var i = 0; i <= 11; i++)
	{ds_list_add(analogue_sticks, [0,0,0,0]);};

function fnInputGetStickValues()
	{
	for(var i = 0; i < gamepad_get_device_count(); i++)
		{
		if(gamepad_is_connected(i))
			{
			var _LH = gamepad_axis_value(i, gp_axislh);
			var _LV = gamepad_axis_value(i, gp_axislv);
			var _RH = gamepad_axis_value(i, gp_axisrh);
			var _RV = gamepad_axis_value(i, gp_axisrv);
			//create an array of the left and right stick values
			analogue_sticks[| i] = [_LH, _LV, _RH, _RV];
			};
		};
	};*/

#endregion

fnInitializeInputs();