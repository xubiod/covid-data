var final_spacing = width_spacing * (__x - _start);
	if (offset_from_left + (__x - _start)	  * width_scale + final_spacing) < -32 return;
	
	draw_set_alpha(0.5 + 0.5 * (__x == _x));
	
	draw_set_color(c_white);
	draw_rectangle(
		offset_from_left + (__x - _start)	  * width_scale + final_spacing, y,
		offset_from_left + (__x - _start + 1) * width_scale + final_spacing, 256,
		false
	);
	
	var _str = number_format(total_cases[__x - _start], 1, "", ",");
	draw_text_transformed(offset_from_left + (__x - _start) * width_scale + final_spacing, 256 - 4 - (16 * (__x == _x)), _str, 1, 1, 90 * (__x != _x));
	
	draw_set_valign(fa_bottom);
	var date = data_to_use[# __x, 0];
	draw_text_transformed(offset_from_left + (__x - _start) * width_scale + final_spacing, y + 8 + (16 * (__x == _x)), date, 1, 1, -90 * (__x != _x));
	
	var percent = total_cases1[__x - _start] / total_cases[__x - _start];
	var top_of_bar = y - (y - 256) * (percent);
	
	draw_set_color(merge_color(c_black, c_red, __x == _x));
	draw_rectangle(
		offset_from_left + (__x - _start)	  * width_scale + final_spacing, y,
		offset_from_left + (__x - _start + 1) * width_scale + final_spacing, top_of_bar,
		false
	);
	
	draw_set_valign(fa_top);
	draw_set_color(merge_color(merge_color(c_black, c_white, round(percent)), c_red, __x == _x));
	
	var _str = string(percent * 100) + "%";
	var orientation = round(percent) == 1 ? -1 : 1;
	
	var asdf = draw_get_color() != c_red;
	if (asdf) var h = (orientation == 1) ? draw_set_valign(fa_top) : draw_set_valign(fa_bottom);
	
	draw_text_transformed(
		offset_from_left + (__x - _start) * width_scale + final_spacing - (round(percent) * 4 * asdf), 
		top_of_bar - 4 - (16 * (__x == _x)) + (round(percent) * 4 * asdf), 
		_str, 
		1, 1, 
		90 * (__x != _x) * orientation
	);
	
	draw_set_valign(fa_top);
	
	height_scale = 0;
	starting_height_scale = 0;
	number_to_compress = 0;
	number_to_start_compressing = 0;