if (place_meeting(x, y + 1, oSolid))
{
    velocityY = -JUMP_POWER;

    // ONLY set jump sprite if no fling pose is active
    if (flingPose == -1) {
        image_index = 1; // reserved jump frame
        image_speed = 0;
    }
}