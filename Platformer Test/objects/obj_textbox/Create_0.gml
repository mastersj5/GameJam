box = spr_textbox;
frame = spr_portrait_frame;
portrait = spr_goblin_portraits; //set to generic goblin for now
namebox = spr_namebox;

box_width = sprite_get_width(box);
box_height = sprite_get_height(box);
port_width = sprite_get_width(portrait);
port_height = sprite_get_height(portrait);
namebox_width = sprite_get_width(namebox);
namebox_height = sprite_get_height(namebox);

port_x = (global.game_width - box_width - port_width) * 0.5;
//port_y = (global.game_height*0.98) - port_height; //bottom of screen
port_y = port_height - 90;
box_x = port_x + port_width;
box_y = port_y;
namebox_x = port_x;
namebox_y = box_y - namebox_height;

x_buffer = 12;
y_buffer = 8;
text_x = box_x + x_buffer;
text_y = box_y + y_buffer;
name_test_x = namebox_x + (namebox_width/2);
name_text_y = namebox_y + (namebox_height/2);
text_max_width = box_width - (2*x_buffer);

portrait_index = 0; //index 0 = frame 0 = goblin portrait 0 = generic goblin portrait

text[0] = "this is a text string this is a text string this is a text string this is a text string this is a text string this is a text string";
text[1] = "this is the second page";
page = 0;
name = "name";

interact_key = ord("F"); //interact key

text_col = c_black;
name_text_col = c_black;
font = font_add("yoster.ttf", 12, false, false, 32, 128); //pulling yoster.ttf font from Included Files

draw_set_font(font);
text_height = string_height("M");