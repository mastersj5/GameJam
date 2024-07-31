/// @description Base Dialog object Step Event

/*
if (global.showing_dialog == false) {
    if (dialog.count() <= 0) {
        instance_destroy();
        return;
    }
    global.current_dialog = dialog.pop();
    global.showing_dialog = true;
} else {
	if(keyboard_check_pressed(key_next) ) {
		showing_dialog = false;
		alpha = 0;
	}
}
*/
if (!global.showing_dialog) { // Check if dialog is NOT showing
    if (dialog.count() <= 0) {
        instance_destroy();
        return;
    }
    global.current_dialog = dialog.pop();
    global.showing_dialog = true; // Start showing the dialog
} else {
	
    textbox_scripts.update_textbox(); // Call the update_textbox function
    if (keyboard_check_pressed(key_next)) {
        if (dialog.count() > 0) {
            global.current_dialog = dialog.pop();
            textbox_scripts.counter = 0;
            textbox_scripts.pause = false;
        } else {
            global.showing_dialog = false;
            alpha = 0;
        }
    }
}
