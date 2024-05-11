// Inherit the parent event
event_inherited();

minigame = "mg_cereal";

draw = function() { }

enum cerealStates {
	intro,
	introTransition,
	pour,
	congrats
}

state = 0;
stateInit = false;
counter = 0;

function switchState(newState) {
	state = newState;
	stateInit = false;
	counter = 0;
}

switchState(cerealStates.intro);