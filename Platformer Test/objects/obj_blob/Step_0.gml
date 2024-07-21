keyright = keyboard_check(ord("D"));
keyleft = -keyboard_check(ord("A"));
keyjump = keyboard_check_pressed(vk_space);
keyjumplong =keyboard_check(vk_space);

move = keyleft + keyright;
hsp = move * movespeed;
if (vsp < 10) vsp += grav;
//This is to add +1 movement speed when shift is pressed.
if keyboard_check_pressed(ord("Y"))
{
	global.shadow_control = !global.shadow_control
}


if global.shadow_control
{
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

//This is to rotate the player when he faces the other direction.
if keyboard_check(ord("A"))
{
	image_xscale = -1
}
if keyboard_check(ord("D"))
{
	image_xscale = 1
}

}