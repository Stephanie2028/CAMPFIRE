// Input
var inputX = keyboard_check(ord("D")) - keyboard_check(ord("A"));
velocityX += inputX * MOVE_ACCEL;

if (inputX != 0) {
	image_xscale = -inputX * SPRITE_SCALE;	
}

// Running Velocity Cap
if (inputX != 0) {
    velocityX = clamp(velocityX, -MAX_RUN_SPEED, MAX_RUN_SPEED);
}

// Gravity
if (velocityY < 0) {
    velocityY += GRAVITY_UP;
} else {
    velocityY += GRAVITY_DOWN;
}

velocityY = min(velocityY, MAX_FALL_SPEED);