// Generated at 2021-01-26 23:24:08 (518ms) for v2.3+
#region prototypes
globalvar mq_JsonParser; mq_JsonParser = [undefined, /* 1:str */undefined, /* 2:pos */0];
globalvar mq_std_StringBuf; mq_std_StringBuf = [undefined, /* 1:str */undefined, /* 2:strLen */0, /* 3:arr */undefined, /* 4:arrLen */0, /* 5:arrMax */0, /* 6:length */0];
globalvar mq_std_haxe_Exception; mq_std_haxe_Exception = [undefined, /* 1:native */undefined];
globalvar mq_std_haxe_ValueException; mq_std_haxe_ValueException = [undefined, /* 1:native */undefined, /* 2:value */undefined];
#endregion
#region metatype
globalvar std_haxe_type_markerValue; std_haxe_type_markerValue = [];
globalvar mt_JsonParser; mt_JsonParser = new std_haxe_class(7, "JsonParser");
globalvar mt_std_StringBuf; mt_std_StringBuf = new std_haxe_class(8, "std_StringBuf");
globalvar mt_std_haxe_class; mt_std_haxe_class = new std_haxe_class(-1, "std_haxe_class");
globalvar mt_std_haxe_Exception; mt_std_haxe_Exception = new std_haxe_class(9, "std_haxe_Exception");
globalvar mt_std_haxe_ValueException; mt_std_haxe_ValueException = new std_haxe_class(10, "std_haxe_ValueException");
mt_std_haxe_ValueException.superClass = mt_std_haxe_Exception;
#endregion

#region Main

function Main_test() {
	// Main_test()
	trace("src/Main.hx:14:", JsonParser_doParse(JsonParser_create("{\"a\":1,\"b\":[1,2]}")));
}

#endregion

#region JsonParser

function JsonParser_create(_str) {
	// JsonParser_create(str:string)
	var this = [mt_JsonParser];
	array_copy(this, 1, mq_JsonParser, 1, 2);
	this[@1/* str */] = _str;
	this[@2/* pos */] = 0;
	return this;
}

function JsonParser_doParse(this) {
	// JsonParser_doParse(this:JsonParser)->dynamic
	var _result = JsonParser_parseRec(this);
	var _c;
	while (true) {
		_c = string_ord_at(this[1/* str */], this[@2/* pos */]++ + 1);
		if (!(_c >= 0)) break;
		switch (_c) {
			case 9: case 10: case 13: case 32: break;
			default: JsonParser_invalidChar(this);
		}
	}
	return _result;
}

function JsonParser_parseRec(this) {
	// JsonParser_parseRec(this:JsonParser)->dynamic
	while (true) {
		var _c = string_ord_at(this[1/* str */], this[@2/* pos */]++ + 1);
		switch (_c) {
			case 9: case 10: case 13: case 32: break;
			case 123:
				var _obj = { }
				var _field = undefined;
				var _comma1 = undefined;
				while (true) {
					switch (string_ord_at(this[1/* str */], this[@2/* pos */]++ + 1)) {
						case 9: case 10: case 13: case 32: break;
						case 125:
							if (_field != undefined || _comma1 == false) JsonParser_invalidChar(this);
							return _obj;
						case 58:
							if (_field == undefined) JsonParser_invalidChar(this);
							var _o = _obj;
							var _value = JsonParser_parseRec(this);
							if (is_struct(_o)) variable_struct_set(_o, _field, _value); else throw std_haxe_Exception_thrown("This method can only be used with struct values.");
							_field = undefined;
							_comma1 = true;
							break;
						case 44: if (_comma1) _comma1 = false; else JsonParser_invalidChar(this); break;
						case 34:
							if (_field != undefined || _comma1) JsonParser_invalidChar(this);
							_field = JsonParser_parseString(this);
							break;
						default: JsonParser_invalidChar(this);
					}
				}
				break;
			case 91:
				var _arr = [];
				var _comma = undefined;
				while (true) {
					switch (string_ord_at(this[1/* str */], this[@2/* pos */]++ + 1)) {
						case 9: case 10: case 13: case 32: break;
						case 93:
							if (_comma == false) JsonParser_invalidChar(this);
							return _arr;
						case 44: if (_comma) _comma = false; else JsonParser_invalidChar(this); break;
						default:
							if (_comma) JsonParser_invalidChar(this);
							this[@2/* pos */]--;
							std_gml_internal_ArrayImpl_push(_arr, JsonParser_parseRec(this));
							_comma = true;
					}
				}
				break;
			case 116:
				var _save2 = this[2/* pos */];
				if (string_ord_at(this[1/* str */], this[@2/* pos */]++ + 1) != 114 || string_ord_at(this[1/* str */], this[@2/* pos */]++ + 1) != 117 || string_ord_at(this[1/* str */], this[@2/* pos */]++ + 1) != 101) {
					this[@2/* pos */] = _save2;
					JsonParser_invalidChar(this);
				}
				return true;
			case 102:
				var _save = this[2/* pos */];
				if (string_ord_at(this[1/* str */], this[@2/* pos */]++ + 1) != 97 || string_ord_at(this[1/* str */], this[@2/* pos */]++ + 1) != 108 || string_ord_at(this[1/* str */], this[@2/* pos */]++ + 1) != 115 || string_ord_at(this[1/* str */], this[@2/* pos */]++ + 1) != 101) {
					this[@2/* pos */] = _save;
					JsonParser_invalidChar(this);
				}
				return false;
			case 110:
				var _save1 = this[2/* pos */];
				if (string_ord_at(this[1/* str */], this[@2/* pos */]++ + 1) != 117 || string_ord_at(this[1/* str */], this[@2/* pos */]++ + 1) != 108 || string_ord_at(this[1/* str */], this[@2/* pos */]++ + 1) != 108) {
					this[@2/* pos */] = _save1;
					JsonParser_invalidChar(this);
				}
				return undefined;
			case 34: return JsonParser_parseString(this);
			case 45: case 48: case 49: case 50: case 51: case 52: case 53: case 54: case 55: case 56: case 57:
				var _c1 = _c;
				var _start = this[2/* pos */] - 1;
				var _minus = _c1 == 45;
				var _digit = !_minus;
				var _zero = _c1 == 48;
				var _point = false;
				var _e = false;
				var _pm = false;
				var _end = false;
				while (true) {
					_c1 = string_ord_at(this[1/* str */], this[@2/* pos */]++ + 1);
					switch (_c1) {
						case 48:
							if (_zero && !_point) JsonParser_invalidNumber(this, _start);
							if (_minus) {
								_minus = false;
								_zero = true;
							}
							_digit = true;
							break;
						case 49: case 50: case 51: case 52: case 53: case 54: case 55: case 56: case 57:
							if (_zero && !_point) JsonParser_invalidNumber(this, _start);
							if (_minus) _minus = false;
							_digit = true;
							_zero = false;
							break;
						case 69: case 101:
							if (_minus || _zero || _e) JsonParser_invalidNumber(this, _start);
							_digit = false;
							_e = true;
							break;
						case 46:
							if (_minus || _point || _e) JsonParser_invalidNumber(this, _start);
							_digit = false;
							_point = true;
							break;
						case 43: case 45:
							if (!_e || _pm) JsonParser_invalidNumber(this, _start);
							_digit = false;
							_pm = true;
							break;
						default:
							if (!_digit) JsonParser_invalidNumber(this, _start);
							this[@2/* pos */]--;
							_end = true;
					}
					if (_end) break;
				}
				var _f = std_Std_parseFloat(std_string_substr(this[1/* str */], _start, this[2/* pos */] - _start));
				var _i = (_f | 0);
				if (_i == _f) return _i; else return _f;
			default: JsonParser_invalidChar(this);
		}
	}
}

function JsonParser_parseString(this) {
	// JsonParser_parseString(this:JsonParser)->string
	var _start = this[2/* pos */];
	var _buf = undefined;
	var _prev = -1;
	while (true) {
		var _c = string_ord_at(this[1/* str */], this[@2/* pos */]++ + 1);
		if (_c == 34) break;
		if (_c == 92) {
			if (_buf == undefined) _buf = std_StringBuf_create();
			std_StringBuf_addSub(_buf, this[1/* str */], _start, this[2/* pos */] - _start - 1);
			_c = string_ord_at(this[1/* str */], this[@2/* pos */]++ + 1);
			if (_c != 117 && _prev != -1) {
				std_StringBuf_addChar(_buf, 65533);
				_prev = -1;
			}
			switch (_c) {
				case 114: std_StringBuf_addChar(_buf, 13); break;
				case 110: std_StringBuf_addChar(_buf, 10); break;
				case 116: std_StringBuf_addChar(_buf, 9); break;
				case 98: std_StringBuf_addChar(_buf, 8); break;
				case 102: std_StringBuf_addChar(_buf, 12); break;
				case 34: case 47: case 92: std_StringBuf_addChar(_buf, _c); break;
				case 117:
					var _uc = std_Std_parseInt("0x" + std_string_substr(this[1/* str */], this[2/* pos */], 4));
					this[@2/* pos */] += 4;
					if (_prev != -1) {
						if (_uc < 56320 || _uc > 57343) {
							std_StringBuf_addChar(_buf, 65533);
							_prev = -1;
						} else {
							std_StringBuf_addChar(_buf, (_prev - 55296 << 10) + (_uc - 56320) + 65536);
							_prev = -1;
						}
					} else if (_uc >= 55296 && _uc <= 56319) {
						_prev = _uc;
					} else std_StringBuf_addChar(_buf, _uc);
					break;
				default: throw std_haxe_Exception_thrown("Invalid escape sequence \\" + chr(_c) + " at position " + string(this[2/* pos */] - 1));
			}
			_start = this[2/* pos */];
		} else if (_c < 0) {
			throw std_haxe_Exception_thrown("Unclosed string");
		}
	}
	if (_prev != -1) {
		std_StringBuf_addChar(_buf, 65533);
		_prev = -1;
	}
	if (_buf == undefined) {
		return std_string_substr(this[1/* str */], _start, this[2/* pos */] - _start - 1);
	} else {
		std_StringBuf_addSub(_buf, this[1/* str */], _start, this[2/* pos */] - _start - 1);
		return std_StringBuf_toString(_buf);
	}
}

function JsonParser_invalidChar(this) {
	// JsonParser_invalidChar(this:JsonParser)
	this[@2/* pos */]--;
	throw std_haxe_Exception_thrown("Invalid char " + string(string_ord_at(this[1/* str */], this[2/* pos */] + 1)) + " at position " + string(this[2/* pos */]));
}

function JsonParser_invalidNumber(this, _start) {
	// JsonParser_invalidNumber(this:JsonParser, start:int)
	throw std_haxe_Exception_thrown("Invalid number at position " + string(_start) + ": " + std_string_substr(this[1/* str */], _start, this[2/* pos */] - _start));
}

#endregion

#region std.Std

function std_Std_parseFloat(_s) {
	// std_Std_parseFloat(s:string)->real
	var _l = string_length(_s);
	var _n = string_length(string_digits(_s));
	var _p = string_pos(".", _s);
	var _e = string_pos("e", _s);
	if (_e == 0) _e = string_pos("E", _s);
	switch (_e) {
		case 0: break;
		case 1: return NaN;
		case 2: if (_p > 0) return NaN; break;
		default: if (_p > 0 && _e < _p) return NaN;
	}
	if (_e != 0 && _e < _l - 1) switch (string_ord_at(_s, _e + 1)) {
		case 43: case 45: _l--; break;
	}
	if (_n && _n == _l - (string_ord_at(_s, 1) == 45) - (_p != 0) - (_e != 0)) return real(_s); else return NaN;
}

function std_Std_parseInt(_value) {
	// std_Std_parseInt(value:string)->null<int>
	var _n = string_length(string_digits(_value));
	if (_n && _n == string_length(_value) - (string_ord_at(_value, 1) == 45)) return real(_value); else return undefined;
}

#endregion

#region std.string

function std_string_substr(this, _pos, _len) {
	// std_string_substr(this:string, pos:int, ?len:int)->string
	if (false) throw argument[1];
	if (_pos < 0) _pos += string_length(this);
	if (_len == undefined) return string_delete(this, 1, _pos); else return string_copy(this, 1 + _pos, _len);
}

#endregion

#region std.StringBuf

function std_StringBuf_create() {
	// std_StringBuf_create()
	var this = [mt_std_StringBuf];
	array_copy(this, 1, mq_std_StringBuf, 1, 6);
	this[@6/* length */] = 0;
	this[@5/* arrMax */] = 4;
	this[@4/* arrLen */] = 0;
	this[@3/* arr */] = array_create(4);
	this[@2/* strLen */] = 0;
	this[@1/* str */] = "";
	return this;
}

function std_StringBuf_store(this) {
	// std_StringBuf_store(this:StringBuf)
	var _i = this[@4/* arrLen */]++;
	var _m = this[5/* arrMax */];
	var _arr = this[3/* arr */];
	if (_i >= _m) {
		_m *= 2;
		_arr[@_m - 1] = undefined;
		this[@5/* arrMax */] = _m;
	}
	_arr[@_i] = this[1/* str */];
	this[@1/* str */] = "";
	this[@2/* strLen */] = 0;
}

function std_StringBuf_addChar(this, _c) {
	// std_StringBuf_addChar(this:StringBuf, c:int)
	this[@1/* str */] += chr(_c);
	this[@6/* length */] += 1;
	if (++this[@2/* strLen */] >= 128) std_StringBuf_store(this);
}

function std_StringBuf_addSub(this, _s, _pos, _len) {
	// std_StringBuf_addSub(this:StringBuf, s:string, pos:int, ?len:int)
	if (false) throw argument[2];
	var _s1 = (_len != undefined ? std_string_substr(_s, _pos, _len) : std_string_substr(_s, _pos));
	var _n = string_byte_length(_s1);
	this[@1/* str */] += _s1;
	this[@6/* length */] += _n;
	this[@2/* strLen */] += _n;
	if (this[2/* strLen */] >= 128) std_StringBuf_store(this);
}

function std_StringBuf_toString(this) {
	// std_StringBuf_toString(this:StringBuf)->string
	var _arr = this[3/* arr */];
	var _buf = std_StringBuf_buffer;
	buffer_seek(_buf, buffer_seek_start, 0);
	var _i = 0;
	for (var __g1 = this[4/* arrLen */]; _i < __g1; _i++) {
		buffer_write(_buf, buffer_text, _arr[_i]);
	}
	buffer_write(_buf, buffer_string, this[1/* str */]);
	buffer_seek(_buf, buffer_seek_start, 0);
	return buffer_read(_buf, buffer_string);
}

#endregion

#region std.haxe.class

function std_haxe_class(_id, _name) constructor {
	// std_haxe_class(id:int, name:string)
	static superClass = undefined;
	static i_constructor = undefined;
	static marker = undefined;
	static index = undefined;
	static name = undefined;
	self.superClass = undefined;
	self.marker = std_haxe_type_markerValue;
	self.index = _id;
	self.name = _name;
	static __class__ = "class";
}
mt_std_haxe_class.i_constructor = std_haxe_class;

#endregion

#region std.gml.internal.ArrayImpl

function std_gml_internal_ArrayImpl_push(_arr, _val) {
	// std_gml_internal_ArrayImpl_push(arr:array<T>, val:T)->int
	var _i = array_length(_arr);
	_arr[@_i] = _val;
	return _i;
}

#endregion

#region std.haxe.Exception

function std_haxe_Exception_new(this, _message, _previous, _native) {
	// std_haxe_Exception_new(this:Exception, message:string, ?previous:Exception, ?native:any)
	if (false) throw argument[2];
	this[@1/* native */] = (_native != undefined ? _native : this);
}

function std_haxe_Exception_create(_message, _previous, _native) {
	// std_haxe_Exception_create(message:string, ?previous:Exception, ?native:any)
	var this = [mt_std_haxe_Exception];
	array_copy(this, 1, mq_std_haxe_Exception, 1, 1);
	switch (argument_count) {
		case 1: std_haxe_Exception_new(this, argument[0]); break;
		case 2: std_haxe_Exception_new(this, argument[0], argument[1]); break;
		case 3: std_haxe_Exception_new(this, argument[0], argument[1], argument[2]); break;
		default: show_error("Expected 1..3 arguments.", true);
	}
	return this;
}

function std_haxe_Exception_isNativeException(_value) {
	// std_haxe_Exception_isNativeException(value:any)->bool
	if (is_struct(_value)) {
		var _c = variable_struct_get(_value, "__class__");
		if (_c == undefined) return false;
		if (_c == mt_std_haxe_Exception) return true;
		if (!variable_struct_exists(_value, "superClass")) return false;
		for (_c = _c.superClass; is_struct(_c); _c = _c.superClass) {
			if (_c == mt_std_haxe_Exception) return true;
		}
	}
	return false;
}

function std_haxe_Exception_thrown(_value) {
	// std_haxe_Exception_thrown(value:any)->any
	if (std_haxe_Exception_isNativeException(_value)) return _value[1/* native */];
	return std_haxe_ValueException_create(_value);
}

#endregion

#region std.haxe.ValueException

function std_haxe_ValueException_create(_value, _previous, _native) {
	// std_haxe_ValueException_create(value:any, ?previous:Exception, ?native:any)
	var this = [mt_std_haxe_ValueException];
	array_copy(this, 1, mq_std_haxe_ValueException, 1, 2);
	if (false) throw argument[2];
	std_haxe_Exception_new(this, string(_value), _previous, _native);
	this[@2/* value */] = _value;
	return this;
}

#endregion

// std.StringBuf:
globalvar std_StringBuf_buffer; std_StringBuf_buffer = buffer_create(128, buffer_grow, 1);