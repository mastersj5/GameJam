// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@description create_textbox
///@arg text
///@arg speakers

function create_textbox(_text, _speakers){
	var tbox = instance_create_layer(0,0, layer_get_id("Text"), obj_textbox);

	with(tbox){
		text = argument[0];
		speakers = argument[1];
	
		var len = array_length(text);
		var i = 0; repeat(len){
			names[i]		= speakers[i].speaker_name;
			portraits[i]	= speakers[i].portrait_index;
			voices[i]		= speakers[i].voice;
			i++;
		}
		event_perform(ev_other, ev_user1); // run user event 1 (text-wrapping)
	}

	return tbox;

}

