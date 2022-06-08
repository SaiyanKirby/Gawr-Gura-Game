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
#macro iPAUSE 8

#macro iDEVICE 0
#macro iBUTTONID 1
#macro iPRESSED 2
#macro iHELD 3
#macro iRELEASED 4

#macro iNODEVICE -1
#macro iKEYBOARD -2
#macro iMOUSE -3

//for analogue sticks
#macro gp_stickLleft 10000
#macro gp_stickLright 10001
#macro gp_stickLup 10002
#macro gp_stickLdown 10003
#macro gp_stickRleft 10004
#macro gp_stickRright 10005
#macro gp_stickRup 10006
#macro gp_stickRdown 10007

#endregion macros

global.inputs = ds_grid_create(iGRIDWIDTH, iGRIDHEIGHT);
global.input_buffer = ds_list_create();
fnInitializeInputs();
/*
each row is one button
collumns: input device, button ID, pressed, held, released

input types:
	none = -1
	keyboard = -2
	mouse = -3
	gamepad = gamepad ID (0 and up)
*/

//analogue stick variable/functions
global.analogue_deadzone = 0.5; //how far a stick has to be pushed to register
global.analogue_sticks = ds_list_create(); //track all analogue sticks
global.analogue_sticks_previous = ds_list_create(); //for comparing to last frame
for(var i = 0; i < 4; i++)
	{ds_list_add(global.analogue_sticks, [0,0,0,0]);};
ds_list_copy(global.analogue_sticks_previous, global.analogue_sticks);