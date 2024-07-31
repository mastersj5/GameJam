// Initialize variables
attack_range = 25; // The distance at which the enemy will start attacking
attack_cooldown = 240; // Cooldown time between attacks (in steps)
attack_timer = 0;// Timer to track cooldown
decrease_rate = 3;
// Assuming you have a player object named `obj_player`
target_player = obj_player;

attack = new enemy_attack_1();

