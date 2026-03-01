draw_self(); // always first

if (isDragging)
{
    var dx = mouse_x - x;
    var dy = mouse_y - y;

    var len = point_distance(0, 0, dx, dy);

    if (len > 0)
    {
        var nx = dx / len;
        var ny = dy / len;

        var clampedLen = min(MAX_MAGNITUDE, len);

        var launchStrength = MIN_POWER +
            (MAX_POWER - MIN_POWER) * (clampedLen / MAX_MAGNITUDE);

        var arrowLength = launchStrength * 10;

        var endX = x + nx * arrowLength;
        var endY = y + ny * arrowLength;

        draw_set_color(make_color_rgb(0, 224, 237));

        // -------- Gradient Line --------
        var segments = 14;

        for (var i = 0; i < segments; i++)
        {
            var t1 = i / segments;
            var t2 = (i + 1) / segments;

            var x1 = lerp(x, endX, t1);
            var y1 = lerp(y, endY, t1);

            var x2 = lerp(x, endX, t2);
            var y2 = lerp(y, endY, t2);

            var alphaValue = 1 - t1;   // fade out
            var widthValue = 2 * (1 - t1); // slight taper

            draw_set_alpha(alphaValue);
            draw_line_width(x1, y1, x2, y2, widthValue);
        }

        draw_set_alpha(1); // reset alpha
    }
}