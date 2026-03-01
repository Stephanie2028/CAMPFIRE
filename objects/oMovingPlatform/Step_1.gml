prevX = x;
prevY = y;

var targetX = endX;
var targetY = endY;
if(movingToStart){
	targetX = startX;
	targetY = startY;
}

moveX = sign(targetX - x) * moveSpeed;
moveY = sign(targetY - y) * moveSpeed;

x += moveX;
y += moveY;
