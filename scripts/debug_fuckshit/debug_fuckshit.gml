function debug_fuckshit() {
	var msg = "";

	for (var i = 0; i < argument_count; i++) {
		msg += string(argument[i]) + ",";
	}

	return show_debug_message(msg);


}
