global.input_left_pressed = keyboard_check_pressed(ord("A"));
global.input_left_held = keyboard_check(ord("A"));
global.input_left_released = keyboard_check_released(ord("A"));

global.input_right_pressed = keyboard_check_pressed(ord("D"));
global.input_right_held = keyboard_check(ord("D"));
global.input_right_released = keyboard_check_released(ord("D"));

global.input_down_pressed = keyboard_check_pressed(ord("S"));
global.input_down_held = keyboard_check(ord("S"));
global.input_down_released = keyboard_check_released(ord("S"));

global.input_jump_pressed = keyboard_check_pressed(vk_space);
global.input_jump_held = keyboard_check(vk_space);
global.input_jump_released = keyboard_check_released(vk_space);

global.input_attack_pressed = mouse_check_button_pressed(mb_left);
global.input_attack_held = mouse_check_button(mb_left);
global.input_attack_released = mouse_check_button_released(mb_left);
