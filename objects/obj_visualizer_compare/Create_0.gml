/// @description Insert description here
// You can write your code in this editor

_start = 4;
_x = 4;

data_to_use  = load_csv(global._SUPER_DATA[0]);
data_to_use1 = load_csv(global._SUPER_DATA[1]);
title = global._SUPER_DATA[2];

total_cases =  array_create(ds_grid_width(data_to_use) - _start);
total_cases1 = array_create(ds_grid_width(data_to_use1) - _start);

for (var i = 0; i < array_length_1d(total_cases); i++) {
	total_cases[i] = 0;
	for (var _y = 1; _y < ds_grid_height(data_to_use); _y++) {
		total_cases[i] += data_to_use[# i + _start, _y];
	}
}

for (var i = 0; i < array_length_1d(total_cases1); i++) {
	total_cases1[i] = 0;
	for (var _y = 1; _y < ds_grid_height(data_to_use1); _y++) {
		total_cases1[i] += data_to_use1[# i + _start, _y];
	}
}

starting_offset = global._SUPER_DATA[5];
offset_from_left = starting_offset;

held_counter = 0;
dragging_pos = 0;