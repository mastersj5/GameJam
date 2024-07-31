// Check if the target player exists
if global.projetile (instance_exists(target_player)) {
    // Get the player's position
    var player_x = target_player.x;
    var player_y = target_player.y;
    
    // Calculate the direction to the player
    point_direction(x, y, obj_player.x, obj_player.y);
    
    // Move the projectile towards the player
    motion_set(direction, speed);
}

// Optional: Destroy the projectile if it goes out of the room
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}