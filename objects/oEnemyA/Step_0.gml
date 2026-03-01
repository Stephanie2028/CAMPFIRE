var target = instance_nearest(x, y, oPlayer);

// sight range
var dist = point_distance(x, y, target.x, target.y);
if (dist <= RANGE){
	var dir = point_direction(x, y, target.x, target.y);

	// follow player
	velocityX += lengthdir_x(ACCELERATION, dir);
	velocityY += lengthdir_y(ACCELERATION, dir);
}


// cap speed
var spd = point_distance(0, 0, velocityX, velocityY);
if (spd > MAX_SPEED){
    var scale = MAX_SPEED / spd;
    velocityX *= scale;
    velocityY *= scale;
}

// friction.
velocityX *= FRICTION;
velocityY *= FRICTION;

x += velocityX;
y += velocityY;

image_angle = point_direction(0, 0, velocityX, velocityY);