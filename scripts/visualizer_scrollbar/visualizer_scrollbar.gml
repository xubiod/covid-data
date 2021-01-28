function visualizer_scrollbar() {
	var CURRENT = argument[0];
	var MAX = argument[1];

	var HEIGHT = 8;

	var LEFT  = (CURRENT / MAX) * room_width;
	var RIGHT = ((CURRENT + 1) / MAX) * room_width;

	draw_set_color(c_white);

	draw_set_alpha(1);
	draw_rectangle(LEFT, room_height - HEIGHT, RIGHT, room_height, false);

	draw_set_alpha(0.5);
	draw_rectangle(0, room_height - HEIGHT, LEFT, room_height, false);


}
