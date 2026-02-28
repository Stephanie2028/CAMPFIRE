// Timer for smooth color blending
t = 0;
color_speed = 0.003; // very slow, soft transition

// Vertical sway for gradient
sway_speed = 0.2; // slow vertical movement
sway_offset = 0;

// Define colors for top/bottom of gradient
color_top_base = make_color_rgb(10, 20, 60);   // dark blue
color_bottom_base = make_color_rgb(40, 90, 200); // bright blue