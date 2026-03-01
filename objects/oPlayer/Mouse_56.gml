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

        var truePower = MIN_POWER +
            (MAX_POWER - MIN_POWER) * (clampedLen / MAX_MAGNITUDE);

        velocityX = nx * truePower;
        velocityY = ny * truePower;
    }
}

isDragging = false;