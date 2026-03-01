// MOVEMENT
MOVE_ACCEL      = 0.6;

MAX_RUN_SPEED   = 4;   
MAX_FLING_SPEED = 18;  

JUMP_POWER = 5;

GROUND_FRICTION = 0.7;
AIR_FRICTION    = 0.98;

SPRITE_SCALE = 0.06777648;

// GRAVITY
GRAVITY_UP      = 0.15;
GRAVITY_DOWN    = 0.25;
MAX_FALL_SPEED  = 20;

// FLING
FLING_MIN_POWER = 2;
FLING_MAX_POWER = 9;
FLING_COOLDOWN  = 2;

FLING_X_BIAS = 1;

MAX_MAGNITUDE = 120;

// STATE
velocityX = 0;
velocityY = 0;

isDragging = false;
dragStartX = 0;
dragStartY = 0;

isJumping = false;
wasOnGround = false;

VERTICAL_DOMINANCE = 1.3;

flingPose = -1;