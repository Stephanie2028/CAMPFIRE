if (!isDragging) exit;

var dx = mouse_x - x;
var dy = mouse_y - y;

var len = point_distance(0, 0, dx, dy);
if (len == 0) exit;

var nx = dx / len;
var ny = dy / len;

// impulse
var clampedLen = clamp(len, 0, MAX_MAGNITUDE);
var flingPower = lerp(
    FLING_MIN_POWER,
    FLING_MAX_POWER,
    clampedLen / MAX_MAGNITUDE
);

velocityX += nx * flingPower;
velocityY += ny * flingPower;

isDragging = false;
flingPose = 1;