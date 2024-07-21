/// @description handles string_wrap script

speaker_name = names[page];
voice = voices[page];
portrait_index = portraits[page];

global.text_wrapped = string_wrap(text[page], text_max_width);
global.str_len = string_length(global.text_wrapped);
counter = 0; //reset counter when going to new page



