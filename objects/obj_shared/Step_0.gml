/// @description Insert description here
// You can write your code in this editor
// if (!variable_instance_exists(self, "dragging_pos")) dragging_pos = 0;

#macro _A (keyboard_check_pressed(vk_right) || mouse_wheel_down()) - (keyboard_check_pressed(vk_left) || mouse_wheel_up())
#macro _B (keyboard_check(vk_right)) - (keyboard_check(vk_left))

if (sign((keyboard_check(vk_right)) + (keyboard_check(vk_left)))) held_counter++;
else held_counter = 0;

_x += _A + dragging_pos;
if (held_counter > 45 && held_counter % 4 == 0) _x += _B;
else if (held_counter > 90 && held_counter % 2 == 0) _x += _B;
else if (held_counter > 135) _x += _B;
else if (held_counter > 180) _x += _B * 2;

if (_x > ds_grid_width(data_to_use) - 1) {
	_x = ds_grid_width(data_to_use) - 1;
	alarm[0] = 120;
}

if (_x < _start) {
	_x = _start;
	alarm[0] = 120;
}