/// @description Insert description here
// You can write your code in this editor

_start = 4;
_x = 4;

data_to_use = load_csv(global._SUPER_DATA[0]);
title = global._SUPER_DATA[1];
number_to_compress = global._SUPER_DATA[6];

total_cases = array_create(ds_grid_width(data_to_use) - _start);

for (var i = 0; i < array_length_1d(total_cases); i++) {
	total_cases[i] = 0;
	for (var _y = 1; _y < ds_grid_height(data_to_use); _y++) {
		total_cases[i] += data_to_use[# i + _start, _y];
	}
}


starting_height_scale = global._SUPER_DATA[4];
height_scale = starting_height_scale;

starting_offset = global._SUPER_DATA[5];
offset_from_left = starting_offset;

held_counter = 0;
dragging_pos = 0;