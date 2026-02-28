// Stop automatic animation
image_speed = 0;

// Health based on number of sprite frames
max_hp = sprite_get_number(sprite_index);
hp = max_hp;

// State flags
phase_two = false;
dead = false;