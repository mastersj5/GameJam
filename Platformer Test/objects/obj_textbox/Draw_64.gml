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
var c = name_text_col; //shorter var for color
draw_set_halign(fa_center); draw_set_valign(fa_middle);
draw_text_color(name_test_x, name_text_y, speaker_name, c, c, c, c, 1); 
draw_set_halign(fa_left); draw_set_valign(fa_top);

//Draw Text
if(!pause and counter < global.str_len){
	counter++;
	if(counter mod 4 = 0){//only play voice sound every 4 frames
		audio_play_sound(voice, 10, false);
	}
	
	switch(string_char_at(global.text_wrapped, counter)){
		case ",": pause = true; alarm[1] = 15; break;
		case ".":
		case "?":
		case "!": pause = true; alarm[1] = 25; break;
	}
}
var _substr = string_copy(global.text_wrapped, 1, counter);


c = text_col;
draw_text_color(text_x, text_y, _substr, c,c,c,c, 1);