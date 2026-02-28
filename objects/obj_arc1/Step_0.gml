// Advance time
t += arc_speed;

// Oscillation 0 → 1 → 0
var osc = (sin(t) + 1) / 2;

// Interpolate angle from right to left
var angle = lerp(arc_start, arc_end, osc);

// Move along arc (around center)
x = center_x + lengthdir_x(radius, angle);
y = center_y + lengthdir_y(radius, angle);

// Gentle nod
image_angle = sin(t * nod_speed) * nod_amount;

// Very subtle pulse
var pulse = 1 + sin(t * pulse_speed) * pulse_amount;
image_xscale = pulse;
image_yscale = pulse;