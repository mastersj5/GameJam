/// @description 

// Inherit the parent event
event_inherited(); // Inherit from obj_DialogBase

portrait = spr_goblin_portraits; // Set the specific portrait for this NPC
speaker_name = "Wizard"; // Set the speaker name
voice = snd_voice1; // Set the appropriate voice sound

names = ["Wizard", "Player"];

dialog.add(spr_goblin_portraits, 2, "*grunt*", "Wizard");//wizard
dialog.add(spr_goblin_portraits, 2, "Hey, who are you?", "Wizard");
dialog.add(spr_goblin_portraits, 2, "You're not supposed to be here.", "Wizard");
dialog.add(spr_goblin_portraits, 2, "I suppose I'll teach you how to survive if you've made it here.", "Wizard");
dialog.add(spr_goblin_portraits, 2, "Take this circlet. It's infused with a piece of my own philosopher's stone.", "Wizard");
dialog.add(spr_goblin_portraits, 2, "*hands over circlet of gold with a gemstone of the deepest red at its crest*", "Wizard");
dialog.add(spr_goblin_portraits, 2, "Press 'R' to summon a shadow beast with your alchemy circlet.", "Wizard");
dialog.add(spr_goblin_portraits, 2, "Press 'Y' to switch your control into the shadow beast.", "Wizard");

dialog.add(spr_goblin_portraits, 1, "Alright, whatever you say, weirdo.", "Player");//shadow player