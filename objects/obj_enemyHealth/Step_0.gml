// Clamp health
hp = clamp(hp, 0, max_hp);

// Update sprite frame based on health
image_index = max_hp - hp;

// Trigger phase change at half health
if (!phase_two && hp <= max_hp / 2) {
    phase_two = true;
}

// Trigger death at final frame
if (!dead && hp <= 0) {
    dead = true;
}