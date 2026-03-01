// ----------------------------------
// 1) Ground Check
// ----------------------------------

onGround = place_meeting(x, y + 1, oSolid);


// ----------------------------------
// 2) Begin Drag
// ----------------------------------

if (mouse_check_button_pressed(mb_left) && onGround)
{
    isDragging = true;
}


// ----------------------------------
// 3) Release Drag → Launch
// ----------------------------------

if (mouse_check_button_released(mb_left) && isDragging && onGround)
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

        velocityX = nx * launchStrength;
        velocityY = ny * launchStrength;
    }

    isDragging = false;
}


// ----------------------------------
// 4) Horizontal Input (A / D)
// ----------------------------------

var moveInput = keyboard_check(ord("D")) - keyboard_check(ord("A"));

if (moveInput != 0)
{
    velocityX += moveInput * MOVEMENT_SPEED;
}


// ----------------------------------
// 5) Apply Gravity (Stronger Fall)
// ----------------------------------

if (velocityY < 0)
{
    velocityY += GRAVITY;
}
else
{
    velocityY += GRAVITY * 1.5;
}


// ----------------------------------
// 6) Horizontal Movement (Safe)
// ----------------------------------

var moveX = velocityX;

while (abs(moveX) > 0)
{
    var stepX = clamp(moveX, -1, 1);

    if (!place_meeting(x + stepX, y, oSolid))
    {
        x += stepX;
        moveX -= stepX;
    }
    else
    {
        velocityX = 0;
        break;
    }
}


// ----------------------------------
// 7) Vertical Movement (Safe)
// ----------------------------------

var moveY = velocityY;

while (abs(moveY) > 0)
{
    var stepY = clamp(moveY, -1, 1);

    if (!place_meeting(x, y + stepY, oSolid))
    {
        y += stepY;
        moveY -= stepY;
    }
    else
    {
        velocityY = 0;
        break;
    }
}


// ----------------------------------
// 8) Friction (Only When No Input)
// ----------------------------------

if (moveInput == 0)
{
    if (round(velocityX) != 0)
    {
        var frictionApplied = sign(velocityX) * FRICTION;

        if (!onGround)
        {
            frictionApplied /= 4;
        }

        velocityX -= frictionApplied;
    }
    else
    {
        velocityX = 0;
    }
}


// ----------------------------------
// 9) Keep Inside Room Bounds
// ----------------------------------

var halfW = sprite_width * 0.5;
var halfH = sprite_height * 0.5;

if (x < halfW)
{
    x = halfW;
    velocityX = 0;
}

if (x > room_width - halfW)
{
    x = room_width - halfW;
    velocityX = 0;
}

if (y < halfH)
{
    y = halfH;
    velocityY = 0;
}

if (y > room_height - halfH)
{
    y = room_height - halfH;
    velocityY = 0;
}