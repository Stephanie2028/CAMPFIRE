// Moving platforms
var movingPlatform = instance_place(x, y + 1, oMovingPlatform);

if (movingPlatform && bbox_bottom <= movingPlatform.bbox_top + 1) {
    y = movingPlatform.bbox_top - (bbox_bottom - y);

    if (velocityY >= 0) {
        velocityY = 0;
    }

    x += movingPlatform.moveX;
    y += movingPlatform.moveY;
}

// Bubble columns
var bubbleColumn = instance_place(x, y, oBubbleColumn);

if (bubbleColumn) {
    var bx = sign(bubbleColumn.targetX - x);
    var by = sign(bubbleColumn.targetY - y) * bubbleColumn.blastPower;

    velocityX = 0;
    velocityY = 0;

    x += bx;
    y += by;
}

// Ground state
var onGround = place_meeting(x, y + 1, oSolid);
var inputX   = keyboard_check(ord("D")) - keyboard_check(ord("A"));

// Friction
if (onGround && inputX == 0) {
    velocityX *= GROUND_FRICTION;
} else if (!onGround) {
    velocityX *= AIR_FRICTION;
}

// Horizontal movement
var moveX = velocityX;

while (abs(moveX) >= 1) {
    var stepX = sign(moveX);

    if (!place_meeting(x + stepX, y, oSolid)) {
        x += stepX;
        moveX -= stepX;
    } else {
        velocityX = 0;
        moveX = 0;
        break;
    }
}

if (moveX != 0) {
    if (!place_meeting(x + moveX, y, oSolid)) {
        x += moveX;
    } else {
        velocityX = 0;
    }
}

// Vertical movement
var moveY = velocityY;

while (abs(moveY) >= 1) {
    var stepY = sign(moveY);

    if (!place_meeting(x, y + stepY, oSolid)) {
        y += stepY;
        moveY -= stepY;
    } else {
        velocityY = 0;
        moveY = 0;
        break;
    }
}

if (moveY != 0) {
    if (!place_meeting(x, y + moveY, oSolid)) {
        y += moveY;
    } else {
        velocityY = 0;
    }
}

// Fling animation
if (!onGround && flingPose != -1) {
    var vx = velocityX;
    var vy = velocityY;

    if (abs(vx) + abs(vy) >= 0.05) {
        var ax = abs(vx);
        var ay = abs(vy);

        if (ay > ax * VERTICAL_DOMINANCE) {
            flingPose = (vy < 0) ? 3 : 4;
        } else {
            flingPose = (vy < 0) ? 0 : 2;
        }

        image_index = flingPose;
        image_speed = 0;

        if (vx != 0) {
            image_xscale = -sign(vx) * SPRITE_SCALE;
        }
    }
}

// Velocity cap
velocityX = clamp(velocityX, -MAX_FLING_SPEED, MAX_FLING_SPEED);
velocityY = clamp(velocityY, -MAX_FLING_SPEED, MAX_FLING_SPEED);

// Landing
if (onGround && !wasOnGround) {
    flingPose = -1;
    image_index = 0;
}

wasOnGround = onGround;