//These are more variables for my player movement
keyright = keyboard_check(ord("D"));
keyleft = -keyboard_check(ord("A"));
keyjump = keyboard_check_pressed(vk_space);
keyjumplong =keyboard_check(vk_space);
input_interact = keyboard_check_pressed(ord("F"));

// Creating movement
move = keyleft + keyright;
hsp = move * movespeed;
if (vsp < 10) vsp += grav;
//This is to add +1 movement speed when shift is pressed.
if keyboard_check_pressed(vk_shift)
{
	movespeed += 1
}
//This is to stop the sprint function when shift is released.
if keyboard_check_released(vk_shift)
{
	movespeed = 2
}
// This is checking for a floor below us as long as that floor is obj_wall.
if place_meeting(x, y + 2, obj_wall) {
    vsp = keyjump * -jumpspeed;
}
//This is creating the long jump by allowing us to control our jump based on when we release the spacebar.
if (vsp < 0) && (!keyjumplong) vsp = max(vsp, 0);
// Horizontal collision checking
if (hsp != 0) 
{
    if (!place_meeting(x + hsp, y, obj_wall)) 
    {
        x += hsp;
    } else 
  {
        // Handle collision, for example, stop movement
        while (!place_meeting(x + sign(hsp), y, obj_wall)) 
		{
            x += sign(hsp);
        }
        hsp = 0;
  }
}
// Vertical collision checking
if (vsp != 0) 
{
    if (!place_meeting(x, y + vsp, obj_wall)) 
	{
        y += vsp;
    } else 
  {
        // Handle collision, for example, stop movement
        while (!place_meeting(x, y + sign(vsp), obj_wall)) 
		{
            y += sign(vsp);
        }
        vsp = 0;
  }
}
//This is for player animation
///This is to begin the animation when a key is being pressed
if keyboard_check(ord("D"))
{
	image_speed = hsp / 3;
	sprite_index = Player_Sprite_Walking;
}
if keyboard_check(ord("A"))
{
	image_speed = hsp / 3;
	sprite_index = Player_Sprite_Walking;
}
//This is to start the animation for the running function.
if keyboard_check(vk_shift) && keyboard_check(ord("D"))
{
	image_speed = 2
    sprite_index = Player_Sprite_Running;
}
else if keyboard_check_released(ord("D"))
{
	image_speed = 1;
	sprite_index = Player_Sprite_Idle;
}
if keyboard_check(vk_shift) && keyboard_check(ord("A"))
{
	image_speed = 2
    sprite_index = Player_Sprite_Running;
}
else if keyboard_check_released(ord("A"))
{
	image_speed = 1;
	sprite_index = Player_Sprite_Idle;
}
//This is making sure that when nothing is being pressed the animation goes back to idle.
if keyboard_check(vk_nokey)
{
	image_speed = 1;
	sprite_index = Player_Sprite_Idle;
}
//This is an event to bring up the menu when the player hits excape
if keyboard_check(vk_escape)
{
	room_goto(rm_menu);
	room_persistent = rm_game;
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

//Textbox
if(input_interact){//collision detect if NPC is nearby
	
	var inst = collision_rectangle(x-radius, y-radius, x+radius, y+radius, par_NPC, false, false);
	
	if(inst != noone){
		with(inst){//NPC runs the textbox code (dialogue with specific NPC)
			create_textbox(text, speakers);
		}
	}
}
