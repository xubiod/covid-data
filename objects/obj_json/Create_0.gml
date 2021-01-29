/// @description Insert description here
// You can write your code in this editor

selection = 0;
visual_selection = 0;

// JsonParser_doParse(JsonParser_create(json_string))
data = (os_browser == browser_not_a_browser) ? json_parse(file_text_open_read_all("data_list.json")) : JsonParser_doParse(JsonParser_create(file_text_open_read_all("data_list.json")));

all_data = data.data;

item_height = 8;

draw_set_font(font_title);
item_height += string_height("X") + 4;
	
draw_set_font(font_main);
item_height += string_height("X") + 4;
	
item_height += string_height("X");

bar_top = (selection / array_length_1d(all_data)) * room_height;
bar_bottom = ((selection + 1) / array_length_1d(all_data)) * room_height;

held_counter = 0;

function _execute(i, type, file, title, src, last_update) {
	switch (type) {
		case "bar": { 
			var v1 = all_data[i].starting_height_scale;
			var v2 = all_data[i].starting_left_from_screen;
			var v3 = all_data[i].number_to_start_compressing;
		
			load_for_bar(file, title, src, last_update, v1, v2, v3);
			if (debug_mode) debug_fuckshit(file, title, src, last_update, v1, v2, v3);
		
			room_goto(room_visualize_bar); 
			break; 
		}
		case "compare": { 
			var v1 = all_data[i].file2;
			var v2 = all_data[i].starting_left_from_screen;
			load_for_compare(file, v1, title, src, last_update, v2);
			if (debug_mode) debug_fuckshit(file, v1, title, src, last_update, v2);
			room_goto(room_visualize_compare); 
			break; 
		}
		case "leading": { 
			var v1 = all_data[i].starting_height_scale;
			var v2 = all_data[i].starting_left_from_screen;
			var v3 = all_data[i].number_to_start_compressing;
		
			load_for_leading(file, title, src, last_update, v1, v2, v3);
			if (debug_mode) debug_fuckshit(file, title, src, last_update, v1, v2, v3);
			room_goto(room_visualize_leading); 
			break; 
		}
	}
}