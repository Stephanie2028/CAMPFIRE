if (isDragging && onGround)
{
    var dx = mouse_x - x;
    var dy = mouse_y - y;

    var distance = point_distance(0, 0, dx, dy);

    if (distance > 0)
    {
        // Clamp total drag distance
        var clampedDistance = min(MAX_MAGNITUDE, distance);

        // Scale target if too far
        var scale = clampedDistance / distance;

        dx *= scale;
        dy *= scale;

        // Only allow upward targeting
        if (dy < 0)
        {
            // Solve vertical velocity for reaching dy
            var requiredVy = -sqrt(2 * GRAVITY * abs(dy));

            // Time to apex
            var timeToApex = abs(requiredVy) / GRAVITY;

            // Horizontal velocity to match x displacement
            var requiredVx = dx / timeToApex;

            // Clamp total speed to MIN/MAX_POWER
            var totalSpeed = point_distance(0, 0, requiredVx, requiredVy);
            var clampedSpeed = clamp(totalSpeed, MIN_POWER, MAX_POWER);

            var speedScale = clampedSpeed / totalSpeed;

            velocityX = requiredVx * speedScale;
            velocityY = requiredVy * speedScale;
        }
    }
}

isDragging = false;