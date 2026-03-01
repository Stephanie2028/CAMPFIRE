// modification of enemyA with
// an attack cycle!
var target = instance_nearest(x, y, oPlayer);
var dist = point_distance(x, y, target.x, target.y);
var dir = point_direction(x, y, target.x, target.y);

// attack cycling
timer += delta_time;
if (timer >= interval){
    timer -= interval; 
    if (cycle){ // charge
		chargeDir = point_direction(x, y, target.x, target.y);

		velocityX = lengthdir_x(CHARGE_POW, chargeDir);
		velocityY = lengthdir_y(CHARGE_POW, chargeDir);
		charging = true;
		chargeTime = 0;
		cycle = !cycle;
    }else{ // summon
        for (var i=0; i<3; i++){
            instance_create_layer(x, y + i * 100, "Instances", oEnemyA);
        }
        cycle = !cycle;
    }
}

// movement
if (charging){
	// charge!!!
    chargeTime += delta_time / 1000;
    velocityX = lengthdir_x(CHARGE_POW, chargeDir);
    velocityY = lengthdir_y(CHARGE_POW, chargeDir);

    if (chargeTime >= chargeDuration) {
        charging = false;
        velocityX = 0;
        velocityY = 0;
    }
}else if (dist > RANGE){
    // follow player normally
    velocityX += lengthdir_x(ACCELERATION, dir);
    velocityY += lengthdir_y(ACCELERATION, dir);
    velocityX *= FRICTION;
    velocityY *= FRICTION;
}else{
    // slow down if close
    bobTimer += BOB_SPEED;
    y += sin(bobTimer) * 8 * delta_time / 1000000;
}

// speed cap
var spd = point_distance(0, 0, velocityX, velocityY);
if (spd > MAX_SPEED){
    var scale = MAX_SPEED / spd;
    velocityX *= scale;
    velocityY *= scale;
}

x += velocityX;
y += velocityY;

if (target.x > x) {
	image_xscale = 1;   
}else{
	image_xscale = -1; 
}