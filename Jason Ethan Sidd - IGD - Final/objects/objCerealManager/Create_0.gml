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

state = cerealStates.intro;