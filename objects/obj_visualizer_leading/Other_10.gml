var final_spacing = width_spacing * (__x - _start);
	if (offset_from_left + (__x - _start) * width_scale + final_spacing) < -32 return;
	
	var place = total_cases[__x - _start];
	
	draw_set_alpha(0.5 + 0.5 * (__x == _x));
	
	var top_of_bar = y - (place[1]) * height_scale;
	
	draw_set_color(c_white);
	draw_rectangle(
		offset_from_left + (__x - _start)	  * width_scale + final_spacing, y,
		offset_from_left + (__x - _start + 1) * width_scale + final_spacing, top_of_bar,
		false
	);
	
	var newline = __x == _x ? "\n" : "";
	
	var _str = number_format(place[1], 1, "", ",") + newline + "(" + place[0] + ")";
	
	//draw_set_halign(fa_right);
	draw_text_transformed(offset_from_left + (__x - _start) * width_scale + final_spacing, top_of_bar - 4 - (16 * (__x == _x)) - (string_height(_str) * (2/3) * (__x == _x)), _str, 1, 1, 90 * (__x != _x));
	
	draw_set_color(c_black);
	var date = data_to_use[# __x, 0];
	
	//if (abs(top_of_bar - y) < string_width(date)) {
		draw_text_transformed(offset_from_left + (__x - _start) * width_scale + final_spacing, y, date, min(abs(top_of_bar - y) / string_width(date), 1), 1, 90);
	//}
	
	if (place[1] > max_cases) max_cases = place[1];