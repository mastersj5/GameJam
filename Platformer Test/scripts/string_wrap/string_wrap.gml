// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@description string_wrap
///@arg string
///@arg _max_width


function string_wrap(){
	var _str = argument0;
	var _max_width = argument1;

	var _str_len = string_length(_str);
	var _last_space = 1;

	var _count = 1;
	var _substr;

	repeat(_str_len){
		_substr = string_copy(_str, 1, _count);
		if(string_char_at(_str, _count) == " ") _last_space = _count;
	
		if(string_width(_substr) > _max_width){
			_str = string_delete(_str, _last_space, 1);//deleted last space
			_str = string_insert("\n", _str, _last_space);
		}
	
		_count++;
	}

	return _str;

}