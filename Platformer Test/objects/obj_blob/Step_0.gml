move_wrap(true, false, 0);
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

if keyboard_check_pressed(ord("Y"))
{
	global.shadow_control = !global.shadow_control
}

if (vsp < 10) vsp += grav;

if !global.shadow_control
{
	movespeed = 0;
}
//This is checking if a shadow summon is in the room and creating a condition for all of the movement
if global.shadow_control
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
	movespeed = 2
}
// This is checking for a floor below us as long as that floor is obj_wall.
if place_meeting(x, y + 2, obj_floor) {
    vsp = keyjump * -jumpspeed;
}
//This is creating the long jump by allowing us to control our jump based on when we release the spacebar.
if (vsp < 0) && (!keyjumplong) vsp = max(vsp, 0);

if keyboard_check(ord("A"))
{
	image_xscale = -1
}
if keyboard_check(ord("D"))
{
	image_xscale = 1
}
}

//To murder creature
var player_x = obj_wtf.x;
var player_y = obj_wtf.y;

// Calculate the distance to the player
var distance_to_player = point_distance(x, y, obj_wtf.x, obj_wtf.y);

// Check if the player is within attack range
if (distance_to_player < attack_range) {
    // If the attack cooldown has elapsed, attack
    if (attack_timer <= 0) {
		instance_destroy(obj_creature);
        attack_timer = attack_cooldown;
    }
} 