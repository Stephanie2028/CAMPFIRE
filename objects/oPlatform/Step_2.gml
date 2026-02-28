if(goingToStart && point_distance(x, y, startX, startY) < movementSpeed){
	goingToStart = false;
	movementSpeed = 0;
	alarm[0] = waitTime;
}

if(!goingToStart && point_distance(x, y, endX, endY) < movementSpeed){
	goingToStart = true;
	movementSpeed = 0;
	alarm[0] = waitTime;
}