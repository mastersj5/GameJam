/// @description uses script initialization

// Initialize script for textbox functions
textbox_scripts = new scr_textbox_functions();
textbox_scripts.init_textbox(); 


dialog = new Dialogue();
//names = ["Anonymous", "test"];

//key_next = vk_anykey;
key_next = keyboard_check_pressed(ord("F"))

showing_dialog = false;

current_dialog = {};

alpha = 0;


