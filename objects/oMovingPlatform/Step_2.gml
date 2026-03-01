x += moveX;
y += moveY;

if(movingToStart && point_distance(x, y, startX, startY) < moveSpeed){
	movingToStart = false;
	moveSpeed = constSpeed;
	alarm[0] = waitTime;
}

if(!movingToStart && point_distance(x,y, endX, endY) < moveSpeed){
	movingToStart = true;
	moveSpeed = constSpeed;
	alarm[0] = waitTime;
}