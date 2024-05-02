// Inherit the parent event
event_inherited();

minigame = "mg_epic";
draw = function() {};

tutorial = true;

enum pongStates {
	intro,
	tutorial1,
	tutorial2,
	tutorial3,
	playerGrab,
	enemyGrab,
	serve
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
	var initialState = (getGameData("round") == 1 ? pongStates.intro : pongStates.playerGrab);
	switchState(initialState);
}