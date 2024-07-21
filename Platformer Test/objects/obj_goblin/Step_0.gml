//Look at player
if(obj_player.x < x)
{
	image_xscale = -1;
}
else{
	image_xscale = 1;
}

if (vsp < 10) vsp += grav;

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