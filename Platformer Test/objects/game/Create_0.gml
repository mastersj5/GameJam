// Game height and width matching viewport 0 camera
global.game_width = 640;
global.game_height = 360;

display_set_gui_size(global.game_width, global.game_height);

t = font_add("yoster.ttf", 12, false, false, 32, 128);
draw_set_font(t);