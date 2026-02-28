var movingPlatform = instance_place(x, y + 1, oMovingPlatform);

if (movingPlatform && bbox_bottom <= movingPlatform.bbox_top + 1)
{

    y = movingPlatform.bbox_top - (bbox_bottom - y);
    if (velocityY >= 0)
        velocityY = 0;
    x += movingPlatform.moveX;
    y += movingPlatform.moveY;
}