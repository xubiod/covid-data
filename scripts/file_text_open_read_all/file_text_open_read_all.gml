/// file_text_open_read_all(fname)
function file_text_open_read_all(argument0) {
	//
	//  Returns the contents of a given file as a multiline 
	//  string. Lines are delimited by the "#" character.
	//  If the file cannot be read, returns undefined.
	//
	//      fname       file to read, string
	//
	/// GMLscripts.com/license
	{
	    var file = file_text_open_read(argument0);
	    if (file < 0) return undefined;
	    var delim = "\n";
	    var str = "";
	    while (!file_text_eof(file)) {
	        str += file_text_read_string(file);
	        str += delim;
	        file_text_readln(file);
	    }
	    file_text_close(file);
	    return str;
	}


}
