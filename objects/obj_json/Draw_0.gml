/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

visual_selection = smooth_approach(visual_selection, selection, 0.125);

var off = (room_height / 2) - (item_height * visual_selection);

for (var i = 0; i < array_length_1d(all_data); i++) {
	var type = all_data[i].type;
	
	var file = all_data[i].file;
	var title = all_data[i].title;
	var src = all_data[i].source;
	var last_update = all_data[i].last_updated;
	
	var prev_off = off;
	
	draw_set_alpha(1);
	
	draw_set_font(font_title);
	off += string_height("X") + 4;
	
	draw_text(4, off, title);
	
	draw_set_font(font_main);
	off += string_height("X") + 4;
	draw_text(6, off, visualizer_type(type));
	
	off += string_height("X");
	draw_text(6, off, "Last updated: " + last_update);
	
	off += 8;
	
	if (i == selection) {
		draw_set_alpha(0.5);
		draw_rectangle(0, prev_off + string_height("X"), room_width, off + string_height("X"), false);
		// draw_rectangle_color(0, off + string_height("X") + 1, room_width, off + string_height("X") + 16, c_white, c_white, c_black, c_black, false);
		// draw_rectangle_color(0, prev_off + string_height("X"), room_width, prev_off + string_height("X") - 16, c_black, c_black, c_white, c_white, false);
		
		draw_set_alpha((held_counter/29) * 0.125 + 0.25);
		draw_rectangle(0, prev_off + string_height("X"), (held_counter / 59) * room_width, off + string_height("X"), false);
		// draw_rectangle_color(0, off + string_height("X") + 1, (held_counter / 59) * room_width, off + string_height("X") + 16, c_white, c_white, c_black, c_black, false);
		// draw_rectangle_color(0, prev_off + string_height("X"), (held_counter / 59) * room_width, prev_off + string_height("X") - 16, c_black, c_black, c_white, c_white, false);
		
		if (held_counter > 59) {
			_execute(i, type, file, title, src, last_update);
		}
	}
}

bar_height = (1 / array_length_1d(all_data)) * room_height;

bar_top = smooth_approach(bar_top, selection * bar_height, 0.125);
bar_bottom = smooth_approach(bar_bottom, (selection + 1) * bar_height, 0.125);

gpu_set_blendmode(bm_add);

draw_set_alpha(1);
draw_line_width(room_width - 8, bar_top, room_width - 8, bar_bottom, 8);

draw_set_alpha(0.5);
draw_line_width_color(room_width - 8, bar_bottom, room_width - 8, bar_bottom + (bar_height / 4), 8, c_white, c_black);
draw_line_width_color(room_width - 8, bar_top, room_width - 8, bar_top - (bar_height / 4), 8, c_white, c_black);

draw_set_alpha(0.2);
draw_rectangle(room_width - 16, 0, room_width, room_height, false);

gpu_set_blendmode(bm_normal);