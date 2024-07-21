if(keyboard_check_pressed(interact_key)){
	if(counter < global.str_len){counter = global.str_len;}
	else if(page < array_length(text) - 1){
		page++;
		event_perform(ev_other, ev_user1); // run user event 1
	}
	else { instance_destroy(); }
}