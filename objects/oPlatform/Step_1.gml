targetX = endX
targetY = endY

if(goingToStart){
	targetX = startX;
	targetY = startY;
}

moveX = (targetX - x) * movementSpeed;
moveY = (targetY - y) * movementSpeed;