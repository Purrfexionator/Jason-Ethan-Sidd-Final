// Inherit the parent event
event_inherited();

name = "obj_fish";

onActivate = function() {
	if objManager.isTrue("has_fish") {
		instance_destroy();
	}
}