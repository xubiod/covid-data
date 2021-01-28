/// @description Insert description here
// You can write your code in this editor

width_scale = 16;
width_spacing = 4;

max_cases = 0;

draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_font(font_title);
draw_text(4, 4, title);

var _super_tmp_offset = string_height("X");
draw_set_font(font_main);
draw_text(4, 6 + _super_tmp_offset, "Data from: " + global._SUPER_DATA[2] + "\nLast updated: " + global._SUPER_DATA[3]);

for (__x = _start; __x < _x + 1; __x++) {
	event_user(0);
}

height_scale = smooth_approach(height_scale, min(starting_height_scale / ceil(max_cases / number_to_compress), starting_height_scale), 0.125);
offset_from_left = smooth_approach(offset_from_left, starting_offset - max(_x - 40, 0) * (width_scale + width_spacing), 0.5);

if (alarm[0] != 0) {
	draw_set_alpha(alarm[0]/120);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	var _mx = room_width/2;
	var _my = room_height/2;
	
	draw_set_color(c_maroon);
	
	var force = 128 + (-4 * alarm[0]/15);
	
	draw_line_width(_mx - force, _my - force, _mx + force, _my + force, force);
	draw_line_width(_mx - force, _my + force, _mx + force, _my - force, force);
	
	draw_set_color(c_red);
	draw_text_transformed(_mx, _my, "No more data", (force / 64) + 2, (force / 64) + 2, 0);
}

visualizer_scrollbar(_x - _start, array_length_1d(total_cases));