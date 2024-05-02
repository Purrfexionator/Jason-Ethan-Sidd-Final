// Inherit the parent event
event_inherited();

minigame = "mg_epic";
propDepth = 0;

drawScale = 1;
drawAngle = 0;
yTarget = y;
ySpeed = 6;

ballSpeed = 4;
numCatches = 3;

catchesLeft = 0;

draw = function() {
	draw_sprite_ext(sprite_index, image_index, relativeX(), relativeY(), drawScale, drawScale, drawAngle, image_blend, image_alpha);	
}

enum pongEnemyStates {
	idle,
	wait,
	grab,
	serve,
	catchBall
}
state = 0;
stateInit = false;
counter = 0;

function switchState(newState) {
	state = newState;
	stateInit = false;
	counter = 0;
}

onMinigameStart = function() {
	switch getGameData("round") {
		case 1:
			numCatches = 1;
			ballSpeed = 4;
			break;
		case 2:
			numCatches = 2;
			ballSpeed = 5;
			break;
		case 3:
			numCatches = 4;
			ballSpeed = 6;
			break;
	}
}