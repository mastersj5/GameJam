//Horizontal Collision Check and Movement
if (place_meeting(x + hsp, y, obj_floor)) {
    while (!place_meeting(x + sign(hsp), y, obj_floor)) {
        x += sign(hsp); 
    }
    hsp = 0; // Stop movement upon collision
} else {
    x += hsp; // Move if no collision
}
// Vertical Movement & Collision
if (place_meeting(x, y + vsp, obj_floor)) {
    while (!place_meeting(x, y + sign(vsp), obj_floor)) {
        y += sign(vsp); // Nudge until just before the collision
    }
    vsp = 0; // Stop vertical movement upon collision
} else {
    y += vsp; // Move vertically if no collision
}


if (vsp < 10) vsp += grav;

if global.shadow_control
{
	movespeed = 0;
	sprite_index = Player_Sprite_Idle;
	image_speed = 1;
}
//This is checking if a shadow summon is in the room and creating a condition for all of the movement
if !global.shadow_control
{
//These are more variables for my player movement
keyright = keyboard_check(ord("D"));
keyleft = -keyboard_check(ord("A"));
keyjump = keyboard_check_pressed(vk_space);
keyjumplong =keyboard_check(vk_space);
input_interact = keyboard_check_pressed(ord("F"));
//Redefining movespeed when we switch back
move = keyleft + keyright;
hsp = move * movespeed;
if keyboard_check(vk_nokey)
{
	movespeed = 2;
}
//This increases player movement speed when shift is being pressed
if keyboard_check_pressed(vk_shift)
{
	movespeed += 1;
}
//This is to stop the sprint function when shift is released.
if keyboard_check_released(vk_shift)
{
	movespeed = 2;
}
// This is checking for a floor below us as long as that floor is obj_wall.
if place_meeting(x, y + 2, obj_floor) {
    vsp = keyjump * -jumpspeed;
}
//This is creating the long jump by allowing us to control our jump based on when we release the spacebar.
if (vsp < 0) && (!keyjumplong) vsp = max(vsp, 0);

//This is for player animation
///This is to begin the animation when a key is being pressed
//This is making sure that when nothing is being pressed the animation goes back to idle.
if keyboard_check(vk_nokey)
{
	image_speed = 1;
	sprite_index = Player_Sprite_Idle;
}
if keyboard_check(ord("D")) && keyboard_check(ord("A"))
{
	image_speed = 1;
	sprite_index = Player_Sprite_Idle;
}
else if keyboard_check(ord("D"))
{
	image_speed = hsp / 3;
	sprite_index = Player_Sprite_Walking;
}
else if keyboard_check(ord("A"))
{
	image_speed = hsp / 3;
	sprite_index = Player_Sprite_Walking;
}
//This is to start the animation for the running function.
if keyboard_check(vk_shift) && hsp
{
	image_speed = 2
    sprite_index = Player_Sprite_Running;
}
if keyboard_check_released(ord("D"))
{
	image_speed = 1;
	sprite_index = Player_Sprite_Idle;
}
if keyboard_check_released(ord("A"))
{
	image_speed = 1;
	sprite_index = Player_Sprite_Idle;
}

//This is an event to bring up the menu when the player hits excape
if keyboard_check(vk_escape)
{
	room_goto(rm_menu);
	room_persistent = rm_shadow_realm;
}
//This is to rotate the player when he faces the other direction.
if keyboard_check(ord("A"))
{
	image_xscale = -1
}
if keyboard_check(ord("D"))
{
	image_xscale = 1
}
// This is the basis of how the goblin will spawn shadow creatures
if keyboard_check(ord("R"))
{
    // Check if an instance of obj_blob already exists
    if (!instance_exists(obj_blob))
    {
        var spawn_distance = 32; // Distance in front of the character
        var spawn_x = x + lengthdir_x(spawn_distance, direction);
        var spawn_y = y + lengthdir_y(spawn_distance, direction);

        instance_create_depth(spawn_x, spawn_y, -100, obj_blob);
    }
}

}
//Textbox
if(input_interact){//collision detect if NPC is nearby
	
	var inst = collision_rectangle(x-radius, y-radius, x+radius, y+radius, obj_par_NPC, false, false);//only interacting with objects that inherit obj_par_NPC
	//var closest_npc = instance_nearest(x, y, obj_par_NPC); // Find nearest NPC
	
	if(inst != noone){
		with(inst){//NPC runs the textbox code (dialogue with specific NPC)
			//create_textbox(text, speakers); // old dialogue functionality
			//global.showing_dialog = true;
			if(!global.dialog_occurring){//created in game object for ensuring only one dialog box can be created
				global.current_dialog_obj = inst.dialog_object; // Set current dialog based on NPC
				var dialog_inst = instance_create_layer(0, 0, "Dialog", global.current_dialog_obj);//create instance of current global dialog obj at origin in room
				global.dialog_occurring = true;
			}
		}
	}
}

move_wrap(true, false, 0);

// Creating movement
move = keyleft + keyright;
hsp = move * movespeed;

//Defining health and destroying player when health is = to 0
// Check if player's HP is 0
if global.hp = 0
{
   room_goto(rm_gameover)
}