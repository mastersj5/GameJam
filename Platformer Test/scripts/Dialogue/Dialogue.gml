/// @description Dialogue functions : add, pop, count
/// @function add(sprite, subimage, message)
/// @function pop()
/// @function count()
function Dialogue() constructor{
	
	_dialogs = [];
	
	add = function(_sprite, _subimage, _message, _name) {//add new message with the speaker attached
		array_push(_dialogs, {
			sprite: _sprite,
			subimage: _subimage, // Store the subimage/frame index
			message: _message,
			name: _name // Store the name
		});
	}
	
	pop = function() {//remove the first message in the dialogs array
		var _t = array_first(_dialogs);
		array_delete(_dialogs, 0, 1);
		
		return _t;
	}
	
	count = function() {//count remaining dialog messages
		return array_length(_dialogs);
	}
	
}