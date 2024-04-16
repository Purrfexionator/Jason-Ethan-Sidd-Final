// Inherit the parent event
event_inherited();

name = "obj_computer";

onActivate = function() {
	if objManager.isTrue("tried_door") {
		image_index = 1;
	}
}