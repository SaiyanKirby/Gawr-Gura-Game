/// @description Initialize game

#region #define global variables

global.build_number = "0009"

global.fontDamageNumber = font_add_sprite(sprFontDamageNumber, ord("!"), false, 1);
global.fontMain = fontFredokaOne20p;
global.fontDebug = fontFredokaOne10p;
draw_set_font(global.fontMain);
global.font_width = string_width("O");
global.font_height = string_height("O");

#endregion

//instantiate manager objects
instance_create_depth(0, 0, -1000, objDebugManager);
instance_create_depth(0, 0, -1000, objInputManager);
instance_create_depth(0, 0, -1000, objResolutionManager);
instance_create_depth(0, 0, -1000, objAudioManager);
instance_create_depth(0, 0, -1000, objCameraManager);
instance_create_depth(0, 0, -1000, objGUIWindowManager);