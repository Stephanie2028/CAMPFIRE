var jumpPow = velocityY * MAX_POWER;

if(jumpPow > 0) jumpPow *= -1;

velocityY *= jumpPow;

y *= velocityY;