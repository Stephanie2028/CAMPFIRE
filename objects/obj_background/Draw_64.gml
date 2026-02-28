// Blend factor oscillates 0 → 1
var blend = (sin(t) + 1) / 2;

// Top/bottom colors smoothly blend over time
var top_color = merge_color(color_top_base, color_bottom_base, blend);
var bottom_color = merge_color(color_bottom_base, color_top_base, blend);

// Draw single full-screen vertical gradient
draw_rectangle_colour(
    0, 0 + sway_offset,
    display_get_gui_width(), display_get_gui_height() + sway_offset,
    top_color, top_color,
    bottom_color, bottom_color,
    false
);