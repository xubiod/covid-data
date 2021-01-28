/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(vk_down)) {
	selection = (selection + 1) % array_length_1d(all_data);
} else if (keyboard_check_pressed(vk_up)) {
	selection = selection - 1;
	if (selection < 0) selection = array_length_1d(all_data) - 1;
}

held_counter = sign(mouse_check_button(mb_left) + keyboard_check(vk_space)) ? (held_counter + 1) : smooth_approach(held_counter, 0, 0.3);