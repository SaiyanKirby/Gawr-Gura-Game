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

#region initialize values

//set all inputs to keyboard
ds_grid_set_region(global.inputs, iDEVICE, 0, iDEVICE, iGRIDHEIGHT-1, iKEYBOARD);
//set all pressed/held/released to false
ds_grid_set_region(global.inputs, iPRESSED, 0, iRELEASED, iGRIDHEIGHT-1, false);
//set each button
global.inputs[# iBUTTONID, iLEFT] = ord("A");
global.inputs[# iBUTTONID, iRIGHT] = ord("D");
global.inputs[# iBUTTONID, iUP] = ord("W");
global.inputs[# iBUTTONID, iDOWN] = ord("S");
global.inputs[# iBUTTONID, iJUMP] = vk_space;

global.inputs[# iDEVICE, iATTACK] = iMOUSE;
global.inputs[# iBUTTONID, iATTACK] = mb_left;

global.inputs[# iBUTTONID, iCONFIRM] = vk_space;
global.inputs[# iBUTTONID, iBACK] = vk_escape;
global.inputs[# iBUTTONID, iMENU] = vk_escape;

#endregion
