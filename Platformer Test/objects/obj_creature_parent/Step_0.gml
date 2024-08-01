var player_x = obj_player.x;
var player_y = obj_player.y;

// Calculate the distance to the player
var distance_to_player = point_distance(x, y, obj_player.x, obj_player.y);

// Check if the player is within attack range
if (distance_to_player < attack_range) {
    // If the attack cooldown has elapsed, attack
    if (attack_timer <= 0) 
	{
	   // Call the attack script
       sprite_index = Shadow_Creature_1_Attacking;
	   image_speed = 1;
        // Reset the attack timer
        attack_timer = attack_cooldown;
    }
} 

// Decrease the attack timer
else if (attack_timer > 0) {
    attack_timer = 0;
	sprite_index = Shadow_Creature_1;
	image_speed = 1;
}