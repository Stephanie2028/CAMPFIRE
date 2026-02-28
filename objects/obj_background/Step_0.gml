// Advance timer
t += color_speed;

// Vertical sway oscillates smoothly
sway_offset = sin(t * sway_speed) * display_get_gui_height() * 0.1;