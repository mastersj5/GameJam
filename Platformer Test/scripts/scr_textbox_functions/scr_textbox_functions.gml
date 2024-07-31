/// @description Dialogue functions : init_textbox, draw_textbok, & update_textbox
/// @function 
function scr_textbox_functions() constructor{

	// Function to initialize textbox variables and settings
	init_textbox = function(){
	
		box = spr_textbox;
		frame = spr_portrait_frame;
		portrait = spr_goblin_portraits; //set to generic goblin for now
		namebox = spr_namebox;

		box_width		= sprite_get_width(box);
		box_height		= sprite_get_height(box);
		port_width		= sprite_get_width(portrait);
		port_height		= sprite_get_height(portrait);
		namebox_width	= sprite_get_width(namebox);
		namebox_height	= sprite_get_height(namebox);

		//Dialogue Box Positioning
		port_x		= (global.game_width - box_width - port_width) * 0.5;
		//port_y = (global.game_height*0.98) - port_height; //bottom of screen
		port_y		= port_height - 90;
		box_x		= port_x + port_width;
		box_y		= port_y;
		namebox_x	= port_x;
		namebox_y	= box_y - namebox_height;

		x_buffer	= 12;
		y_buffer	= 8;
		text_x		= box_x + x_buffer;
		text_y		= box_y + y_buffer;
		name_test_x = namebox_x + (namebox_width/2);
		name_text_y	= namebox_y + (namebox_height/2);

		portrait_index	= 0; //index 0 = frame 0 = goblin portrait 0 = generic goblin portrait
		counter			= 0; //counter for "typing" text out
		pause			= false; //pause "typing" for punctuation

		pause_timer = 0;
		pause_duration = 15; // Base duration, can be adjusted per punctuation
		previous_message = "";

		text_col		= c_black;
		name_text_col	= c_black;
		font			= font_add("yoster.ttf", 12, false, false, 32, 128); //pulling yoster.ttf font from Included Files

		draw_set_font(font);
		text_height		= string_height("M");
		text_max_width	= box_width - (2*x_buffer);

		text[0] = "";
		page	= 0;
		speaker_name	= "";
		voice	= snd_voice1;

		interact_key = ord("F"); //interact key

	}
	
	// Function to draw the textbox, portrait, text, etc.
	function draw_textbox() {
		//Draw Box
		draw_sprite(box, 0, box_x, box_y);

		//Draw Portrait Back
		draw_sprite(frame, 0, port_x, port_y);

		//Draw Portrait
		draw_sprite(portrait, portrait_index, port_x, port_y);

		//Draw Portrait Frame
		draw_sprite(frame, 1, port_x, port_y);

		//Draw Namebox
		draw_sprite(namebox, 0, namebox_x, namebox_y);


		//----TEXT
		draw_set_font(font);

		//Draw Name
		speaker_name = global.current_dialog.name;
		voice = global.current_dialog_obj.voice;
		
		var c = name_text_col; //shorter var for color
		draw_set_halign(fa_center); draw_set_valign(fa_middle);
		draw_text_color(name_test_x, name_text_y, speaker_name, c, c, c, c, 1); 
		draw_set_halign(fa_left); draw_set_valign(fa_top);


		
		//speaker_name = names[page];
		//voice = voices[page];
		//portrait_index = portraits[page];

		global.text_wrapped = string_wrap(text[page], text_max_width);
		global.str_len = string_length(global.text_wrapped);
		counter = 0; //reset counter when going to new page


	}
	
	
	
	// Function to handle the text typing, pausing, and sound effects
	function update_textbox() {
	    // Get current dialog from global
	    portrait_index = global.current_dialog.subimage; //Set current portrait
	    text[page] = global.current_dialog.message; // Set current text
	    //show_debug_message("Text Page: " + string(text[page]));

	    // Reset variables for new dialog message
	    if (previous_message != text[page]) {  // Check if a new message has been loaded
	        global.text_wrapped = string_wrap(text[page], text_max_width);
	        global.str_len = string_length(global.text_wrapped); // Calculate str_len
	        counter = 0; // Reset the counter
	        //_substr = ""; // Reset the substring
	        previous_message = text[page]; // Update the previous message variable
	    }

	    // Custom Pause Logic (No Alarm)
	    if (pause) {
	        pause_timer++; 
	        if (pause_timer >= pause_duration) { 
	            pause = false;
	            pause_timer = 0; 
	        }
	    } else { 
	        if (counter < global.str_len) {
	            counter++;

	            // Play Sound (only if not paused)
	            if (counter mod 4 == 0) {
	                audio_play_sound(voice, 10, false);
	            }

	            var current_char = string_char_at(global.text_wrapped, counter);
            
	            // Adjust pause duration (optional)
	            switch (current_char) {
	                case ",": pause_duration = 10; break;
	                case ".":
	                case "?":
	                case "!": pause_duration = 30; break;
	            }
            
	            // Trigger Pause 
	            if (current_char == "," || current_char == "." || current_char == "?" || current_char == "!") {
	                pause = true;
	            }
	        }
	    }

	    var _substr = string_copy(global.text_wrapped, 1, counter); // Update the substring

	    c = text_col;
	    draw_text_color(text_x, text_y, _substr, c,c,c,c, 1);
		
	}


}