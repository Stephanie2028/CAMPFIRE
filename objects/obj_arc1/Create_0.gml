// Center of the room
center_x = room_width / 2;
center_y = room_height / 2;

// Start object exactly at center
x = center_x;
y = center_y;

// Arc settings (right → left)
radius = 100;
arc_start = 0;      // right side
arc_end = 180;      // left side
arc_speed = 0.025;

// Motion timer
t = 0;

// Nodding
nod_speed = 0.4;
nod_amount = 6;

// Subtle pulse
pulse_speed = 0.15;
pulse_amount = 0.02;