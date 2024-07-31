function enemy_attack_1() constructor {
    // Initialize variables
    spawn_distance = 8; // Distance in front of the character

    // Define perform_attack function
    perform_attack = function() {
        // Use self to refer to the instance of obj_creature
        var spawn_x = self.x + lengthdir_x(spawn_distance, self.direction);
        var spawn_y = self.y + lengthdir_y(spawn_distance, self.direction);

        if (!instance_exists(obj_enemy_projectile)) {
            instance_create_depth(spawn_x, spawn_y, 10, obj_enemy_projectile);
        }
    };
}