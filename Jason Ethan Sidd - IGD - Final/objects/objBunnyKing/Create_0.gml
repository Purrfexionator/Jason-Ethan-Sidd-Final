// Inherit the parent event
event_inherited();

name = "obj_bunny_king";

onActivate = function() {
	if objManager.isTrue("met_goblin") {
		sprite_index = sprApple;
	} else {
		sprite_index = sprNone;
	}
}